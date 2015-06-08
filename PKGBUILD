# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Ionut Biru <ibiru@archlinux.org>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=utopic
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck#freedesktop: name=${pkgname%-*}, majorver=3.14
# vercheck#ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=accountsservice-ubuntu
_ubuntu_rel=1ubuntu9
_ubuntu_ver=0.6.37
pkgver=0.6.39
pkgrel=1
pkgdesc="D-Bus interface for user account query and manipulation"
arch=(i686 x86_64)
url="http://cgit.freedesktop.org/accountsservice/"
license=(GPL3)
depends=(glib2 polkit systemd lightdm-ubuntu)
makedepends=(intltool gobject-introspection vala)
provides=("accountsservice=${pkgver}")
conflicts=(accountsservice)
source=("http://cgit.freedesktop.org/accountsservice/snapshot/accountsservice-${pkgver}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/accountsservice_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz"
        0001-Support-setting-reading-LightDM-autologin-setings.patch)
sha512sums=('95010b312650eaa629a8ef5ea29a0fd1b8c256c67e645e7b35d77967306ea7591f507d3c2df385ea3393cbb26fa4c798716d301bcbfd9dbb350a6f9172810db8'
            'b6c51ec1ca513100f109629ddd0c2b6575e5cba8f5ef5c39399ae8bc8a53078a22b522747cd659ed96de217555fbda5238de06f698c6d94a530eacd2b807a615'
            '0ba299e57a1629993f19bbc07178262bd07040f64e61df78c7b16596956be8037c6aff087505ece9d2f65c1bc66c8628ab09bcdb6ba9e2e4b2a6e937dd6cb2df')

prepare() {
  cd "accountsservice-${pkgver}"

  #patch -p1 -i ../0001-Support-setting-reading-LightDM-autologin-setings.patch

  # Apply Ubuntu patches
    # Disable patches
    sed -i \
      `# We have refreshed versions` \
        -e '/0007-add-lightdm-support.patch/d' \
      `# Arch Linux uses wheel group for system administration` \
        -e '/0002-create-and-manage-groups-like-on-a-ubuntu-system.patch/d' \
      `# adduser is Debian-specific` \
        -e '/0006-adduser_instead_of_useradd.patch/d' \
      `# Language patches are still pretty specific to Ubuntu, though` \
      `# Ubuntu is trying to get them merged upstream` \
        -e '/0001-formats-locale-property.patch/d' \
        -e '/0009-language-tools.patch/d' \
        -e '/0010-set-language.patch/d' \
        -e '/0012-add-keyboard-layout-support.patch/d' \
      `# Ubuntu-specific` \
        -e '/0021-support-extrausers.patch/d' \
        -e '/0016-add-input-sources-support.patch/d' \
      `# We do not need a pin-based authentication method` \
        -e '/0014-pam-pin.patch/d' \
        -e '/0015-pam-pin-ubuntu.patch/d' \
      `# Applied upstream` \
        -e '/0022-fix-desktop-centric-polkit-policy.patch/d' \
      `# Does not apply cleanly` \
        -e '/0013-add-has-message-support.patch/d' \
        ../debian/patches/series

  for i in $(grep -v '#' ../debian/patches/series); do
    msg "Applying ${i} ..."
    patch -p1 -i "../debian/patches/${i}"
  done
}

build() {
  cd "accountsservice-${pkgver}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/accountsservice \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --localstatedir=/var \
    --disable-static \
    --enable-systemd

  make
}

package() {
  cd "accountsservice-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
