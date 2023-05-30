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
pkgver=2023.03.08
pkgrel=1
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/iron/"
arch=('any')
license=('Apache')
depends=(
    'ros2-arch-deps'
)
source=(
    "ros2::git+https://github.com/ros2/ros2#tag=release-iron-20230523"
    repos.patch
    rviz-ogre-featuresummary-rename.patch
)
sha256sums=('SKIP'
            'f9939a1088ee3cee77b557609ba41afdc5060030b72216bc4a00c2cc407c851f'
            '1161ebc8d86a77a8880132db35cfeeacbe08451c4e48105c352135bf014c3fc4')
install=ros2-iron.install

prepare() {
    # Check locale according to
    # https://docs.ros.org/en/rolling/Installation/Ubuntu-Development-Setup.html#set-locale
        if ! locale | grep LANG | grep 'UTF-8\|utf8' > /dev/null; then
        echo 'Your locale must support UTF-8. See ' \
             'https://wiki.archlinux.org/index.php/locale and ' \
             'https://docs.ros.org/en/rolling/Installation/Ubuntu-Development-Setup.html#set-locale'
        exit 1
    fi

    patch -p1 -d $srcdir/ros2 < repos.patch

    # Clone the repos
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    patch -p1 -d $srcdir/ros2/src/ros2/rviz < rviz-ogre-featuresummary-rename.patch
}

build() {
    # Disable parallel build if RAM is low
    MIN_PARALLEL_BUILD_RAM_KB=16000000
    if [[ $(free | grep -Po "Mem:\s+\K\d+") -lt $MIN_PARALLEL_BUILD_RAM_KB && $(grep MemTotal /proc/meminfo | grep -Po "MemTotal:\s+\K\d+") -lt $MIN_PARALLEL_BUILD_RAM_KB ]]; then
        printf "\nRAM is smaller than 16 GB. Parallel build will be disabled for stability.\n\n"
        export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"
    fi

    ## For people with the old version of makepkg.conf
    unset CPPFLAGS
    ## For people with the new version of makepkg.conf
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=2\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=2\s//g" <(echo $CXXFLAGS))

    # Build
    colcon build --merge-install ${COLCON_EXTRA_ARGS}
}

package() {
    mkdir -p $pkgdir/opt/ros/iron
    cp -r $srcdir/install/* $pkgdir/opt/ros/iron/
}
