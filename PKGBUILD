# Maintainer: Jan Hicken <firstname [dot] lastname [at] hotmail [dot] de>
# Contributor: Oskari Rauta <oskari.rauta@gmail.com>

pkgname=networkmanager-strongswan-passwordstore
_pkgname=NetworkManager-strongswan
pkgver=1.4.1
_pkgver=1.3.1
pkgrel=2
pkgdesc="Strongswan NetworkManager plugin with default setting to save vpn password in keyfile"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
provides=("networkmanager-strongswan=$pkgver")
conflicts=("networkmanager-strongswan")
depends=("nm-connection-editor>=1.4.0" "libsecret" "strongswan")
optdepends=("network-manager-applet>=1.4.0": Graphical configuration)
makedepends=('intltool')
source=("http://download.strongswan.org/NetworkManager/$_pkgname-$_pkgver.tar.gz"
        'fix-vbox-parent.patch'
	'0001-nm-set-full-path-to-the-connection-editor-plugin.patch'
	'0002-nm-drop-some-unneeded-dependencies.patch'
	'0003-nm-drop-useless-calls-to-AC_SUBST.patch'
	'0004-nm-split-the-plugin-into-two-halves.patch'
	'0005-nm-check-for-libnm.patch'
	'0006-nm-port-to-libnm.patch'
	'0007-nm-replace-libgnomeui-with-libnma-for-password-dialo.patch'
	'0008-nm-replace-libgnomekeyring-with-libsecret.patch'
	'0009-nm-bump-to-GTK-3.0.patch'
	'0010-nm-bump-minor-version-to-1.4.1.patch'
	'0011-nm-install-the-.name-file-into-usr-lib-NetworkManage.patch'
	'0012-nm-save-password-locally.patch')
sha256sums=('8f67bf0e7281ee8dfb1c7fe28ef8d06774744e2135682f4ddae4342fd103d46a'
            'c9f7f6819753ff2834015ba18ffed39c4b5ae5e0e71c377ee49c105f0d9b1f99'
            'c2dd38ae4bc91e882d0a6c41dbb45f91fc3bf2124c33ca457c0d569c160d87ee'
            'dd5a5ecb2bdf90b99bdc5deb037cd0ad83e8e212ae853abb505b117871972865'
            '4e9f5b7d889c596135e8cef6ca1b36ed96392479302e70ca6af258bd6b9279d3'
            'd6baefb23c17a9ac0717ac9d1e81b4935f79270923f57ccf0d5259ae67f2f6b4'
            '2ea1cac933f5a4c09940bb77499b4d300e3726438185726448faa1bd8d0a2370'
            'f2f64460fb5f94e9625f519e9a6886efd1fc5adfc664d46ec54ecfd65532bd8f'
            '6e1a0d0dc979d69efc5e4f112d2306d0ff8e94d00bd9a8fb0e150ecaf6145bbb'
            'ec5aa3f85d7ef42e9ecdfd1cdf1b7c6bdc32b8586afb72b8fafdd5b2b53b9bbc'
            '0a06dd9ed6bf715a6229b30ad399eeab410510fa7eb3a49340b65040e7434328'
            '149967427c6e66b0666c233cdd2c7ea734ee9032f820f148212841b2ffe79188'
            '8f1bc53c5de2d431e1ce7c3370241e8ea1f815e7289aed1bfd00a059359655c6'
            '35180eb253c0bd55f1ef1c70d9a7d89290d659d568c7a2e05093c1f95e5eee35')

prepare() {
  cd "$_pkgname-$_pkgver"
  patch -p1 -i ../fix-vbox-parent.patch
  patch -p1 -i ../0001-nm-set-full-path-to-the-connection-editor-plugin.patch
  patch -p1 -i ../0002-nm-drop-some-unneeded-dependencies.patch
  patch -p1 -i ../0003-nm-drop-useless-calls-to-AC_SUBST.patch
  patch -p1 -i ../0004-nm-split-the-plugin-into-two-halves.patch
  patch -p1 -i ../0005-nm-check-for-libnm.patch
  patch -p1 -i ../0006-nm-port-to-libnm.patch
  patch -p1 -i ../0007-nm-replace-libgnomeui-with-libnma-for-password-dialo.patch
  patch -p1 -i ../0008-nm-replace-libgnomekeyring-with-libsecret.patch
  patch -p1 -i ../0009-nm-bump-to-GTK-3.0.patch
  patch -p1 -i ../0010-nm-bump-minor-version-to-1.4.1.patch
  patch -p1 -i ../0011-nm-install-the-.name-file-into-usr-lib-NetworkManage.patch
  patch -p1 -i ../0012-nm-save-password-locally.patch
}

build() {
  cd "$_pkgname-$_pkgver"

  export CFLAGS="$CFLAGS -Wno-error=deprecated-declarations"
  autoreconf -f -i
  ./configure --sysconfdir=/etc --prefix=/usr \
    --libexecdir=/usr/lib/networkmanager \
    --with-charon=/usr/lib/strongswan/charon-nm
  make
}

package() {
  cd "$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
