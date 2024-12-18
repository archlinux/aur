# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

# Based on PKGBUILD for package: extra/xfwm4 (4.18.0-1)
pkgname=xfwm4-windowcenter
pkgver=4.20.0
pkgrel=1
pkgdesc="Xfce's window manager, with a patch to allow titles to be centered relatively to the full window width."
arch=('x86_64')
url="https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
provides=("xfwm4=$pkgver")
conflicts=("xfwm4")
source=("$pkgname::git+https://gitlab.xfce.org/xfce/xfwm4.git#tag=xfwm4-$pkgver"
        pr27{,-locale-pl}.patch)
md5sums=('56229de93117479a581a702119dc37bc'
         '24a805493328f9fd35b6dd1dac13c730'
         '23a55d0fd2729d6f35e4c9d2f5007355')
sha512sums=('9342304e2e7a8067a8d6af46f777813ce76a8bfdfe658fdb9d0deb06e2c1650807a8c83b63c93b701f46e52769d2733b2cbd5a94fe34fc979f41950e12c8e8c5'
            'eb3be24eb811ad3e8d8bb23abd89131da6fbce18e333e01abc38fd441c848bad9f8fc60be771501295447b71e18544f22406a75d970c9ca51e82539fc30d1202'
            'b3d6fe95854e302fe20c92db18ec7ea1e536ff6893cf3e99b0cfa4b74b6454b47f3976b8515f47c2e3e23f82b0eb15d63da0e95fc132bc94c8fadb87a2017328')
b2sums=('8d86a56c8bbb8d49f79fdf8e18f5751cc9a42109039e361acd06d0e4107b9e65ce7d096de26235f37af9db2f2c09b312b9cce94f048e42c0cfd47b2db4b0d050'
        '5a33a77450b28534ee3c6aba228699d688619add6e8f6b6d7d524d9159fe7e519ea01924e9571ed080206b1f407d25c396bbd1d458d26d5de86ca8a6e1fc20e7'
        '73fe8a40a2c71e14289a825f992874986e4ae3f08fab21779ea31c1d222776df259f93a2cc490522423e1187c97b74f721e08cebf165ad4e36cfef80dda523c7')

prepare(){
  cd $pkgname
  # Original patch by Ryan Bester (see $url for the reference)
  # Backported for 4.18.0 and localized to Polish by SpacingBat3
  git apply ../pr27{,-locale-pl}.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-maintainer-mode \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
