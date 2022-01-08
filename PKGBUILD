# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Contributor: mjbogusz <mjbogusz+github@gmail.com>
# Contributor: yuanyuyuan <az6980522@gmail.com>
# Contributor: Rémy B. (github.com/KirrimK)
# Contributor: Renato Caldas (github.com/rmsc)
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-git
pkgver=r230.4a36f31
pkgrel=1
pkgdesc="A set of software libraries and tools for building robot applications (Rolling Distro)"
url="https://docs.ros.org/en/rolling/"
arch=('any')
license=('Apache')
depends=(
    'ros2-arch-deps'
    'ros2-pyqt5-sip-compat'
    'assimp'
    'gmock'
    'sip4'
)
source=(
    "ros2::git+https://github.com/ros2/ros2#branch=master"
    "rviz_assimp_vendor.patch"
)
sha256sums=(
    'SKIP'
    "1c097a78a023956fcf877e53ca35e2949a7956045deaf5f7b049a2b237fb391c"
)
install=ros2-git.install

pkgver() {
    cd $srcdir/ros2
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Check locale
    locale | grep LANG | grep UTF-8
    if [[ $? -ne 0 ]]; then
        printf "Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale
        or https://wiki.archlinux.org/index.php/locale ."
        exit 1
    fi

    # Clone the repos
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Fix some issues in the code (TODO: Gradually move to upstream)
    ## rviz_assimp_vendor
    git -C $srcdir/ros2/src/ros2/rviz checkout .
    git -C $srcdir/ros2/src/ros2/rviz apply $srcdir/rviz_assimp_vendor.patch
}

build() {
    # Disable parallel build if RAM is low
    if [[ $(free | grep -Po "Mem:\s+\K\d+") < 16000000 ]]; then
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
    mkdir -p $pkgdir/opt/ros2/rolling
    cp -r $srcdir/install/* $pkgdir/opt/ros2/rolling/
}
