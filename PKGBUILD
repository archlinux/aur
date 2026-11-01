# Maintainer: CrimsonHawk
# SPDX-License-Identifier: GPL-3.0-only
pkgname=kinectcam-git
pkgver=0.2.0.r1.gd9bd42c
pkgrel=1
pkgdesc='Expose Xbox One Kinect RGB, infrared and metric depth as Linux cameras'
arch=('x86_64')
url='https://git.crimsonnet.org/CrimsonHawk/kinectcam'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libfreenect2' 'v4l2loopback-utils' 'V4L2LOOPBACK-MODULE' 'systemd' 'kmod' 'gawk' 'bash')
makedepends=('cmake' 'git' 'python')
checkdepends=('openssh')
optdepends=('v4l-utils: camera diagnostics' 'howdy: infrared facial authentication')
provides=('kinectcam')
conflicts=('kinectcam')
options=('!debug')
source=('kinectcam::git+https://git.crimsonnet.org/CrimsonHawk/kinectcam.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/kinectcam"
    printf '0.2.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -S "$srcdir/kinectcam" -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
