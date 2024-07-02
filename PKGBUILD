# Maintainer: Willem Mulder <14mRh4X0r+pkgbuild@gmail.com>
# Contributor: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Contributor: mjbogusz <mjbogusz+github@gmail.com>
# Contributor: yuanyuyuan <az6980522@gmail.com>
# Contributor: Rémy B. (github.com/KirrimK)
# Contributor: Renato Caldas (github.com/rmsc)
# Contributor: goekce (github.com/goekce)
# Contributor: David Castellon (github.com/bobosito000)
# Contributor: Yannic Wehner <yannic.wehner@gmail.com> (github.com/ElCap1tan)
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-iron
pkgver=2024.04.23
pkgrel=1
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/iron/"
arch=(x86_64 armv7h aarch64)
license=('Apache-2.0')
depends=(
    'ros2-arch-deps'
    'lttng-ust'
    'qt6-base'
)
makedepends=(git)
source=(
    "ros2::git+https://github.com/ros2/ros2#tag=release-iron-20240423"
    ros2_tracing.patch
)
sha256sums=(
    'SKIP'
    b6f77270bbd2d69dd69da249f6c31874ce1fa3cbf3d0b04f7e2d9d4602abbf1e
)
install=ros2-iron.install

prepare() {
    # Check locale according to
    # https://docs.ros.org/en/rolling/Installation/Ubuntu-Development-Setup.html#set-locale
    if ! [[ ${LC_ALL:-$LANG} =~ UTF-8|utf8 ]]; then
        echo 'Your locale must support UTF-8. See ' \
             'https://wiki.archlinux.org/index.php/locale and ' \
             'https://docs.ros.org/en/iron/Installation/Alternatives/Ubuntu-Development-Setup.html#set-locale'
        exit 1
    fi

    # Clone the repos
    mkdir -p "$srcdir"/ros2/src
    vcs import "$srcdir"/ros2/src < "$srcdir"/ros2/ros2.repos

    patch -p1 -N -d "$srcdir"/ros2/src/ros2/ros2_tracing < ros2_tracing.patch
}

build() {
    # Disable parallel build if RAM is low
    _min_parallel_build_ram_kb=16000000
    if [[ $(grep -Po "MemTotal:\s+\K\d+" /proc/meminfo) -lt $_min_parallel_build_ram_kb ]]; then
        printf "\nRAM is smaller than 16 GB. Parallel build will be disabled for stability.\n\n"
        _colcon_extra_args="--executor sequential"
    fi

    ## For people with the old old version of makepkg.conf
    unset CPPFLAGS
    ## For people with a newer version of makepkg.conf
    CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=[23][[:space:]]}"
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCXXE=[23][[:space:]]}"

    # Build
    colcon build --merge-install ${_colcon_extra_args} --packages-skip-by-dep python_qt_binding
}

package() {
    mkdir -p "$pkgdir"/opt/ros/iron
    cp -r "$srcdir"/install/* "$pkgdir"/opt/ros/iron/
}
