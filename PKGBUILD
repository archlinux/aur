# Maintainer: MAntas Mikulėnas <grawity@gmail.com>

pkgname=safenet-authentication-client
pkgver=8.1.0_4
pkgrel=1
_pkgroot=SAC_8_1_0_4_Linux_RPM_64
_rpmname=SafenetAuthenticationClient
_rpmver=8.1.0-4
depends=(
  glib2
  'hal-flash>=0.3.1'
  libusb-compat
  pcsclite
  # libQtGui.so.4 dependencies:
  fontconfig
  freetype2
  libice
  libsm
  libx11
  libxcursor
  libxext
  libxfixes
  libxi
  libxinerama
  libxrandr
  libxrender
)
arch=(x86_64)
source=("http://www.ssc.lt/drivers/aladdin/Kitu%20operaciniu%20sistemu%20etoken%20Rakto%20tvarkykles/eToken_PKI_client_Linux%20vartotojams/SAC%208.1%20Linux/x86_64/$_pkgroot.zip"
        'eTSrv.service')
sha256sums=('c2e462ebc8ef3d2e77aa190ec1bb3cbab7ba2f3485834c1de2757334353669f1'
            'aa1f9b9498fa99dbdc497cd26fbd4a0f757082e8578103c11bd4c74c710a2192')

prepare() {
  cd "$_pkgroot/RPM"
  bsdtar xf "$_rpmname-$_rpmver.x86_64.rpm"
}

package() {
  cd "$_pkgroot/RPM"
  cp -a etc lib64 usr var "$pkgdir"

  cd "$pkgdir"
  rm -rf etc/rc.d
  mv usr/lib64 usr/lib
  mv lib64/* usr/lib/
  ln -sf libeToken.so.8 usr/lib/libeTFS.so
  ln -sf libeToken.so.8 usr/lib/libeToken.so
  ln -sf libeToken.so.8 usr/lib/libeTokenUI.so
  ln -sf libeToken.so.8 usr/lib/libeTPkcs11.so
  ln -sf libeToken.so.8 usr/lib/libeTSapi.so
  rmdir lib64
  find usr/share/{doc,eToken/{languages,shortcuts}}/ -type f -exec chmod a-x {} +

  mkdir -p usr/lib/pkcs11
  ln -s ../libeTPkcs11.so usr/lib/pkcs11/

  mkdir -p usr/share/p11-kit/modules
  echo "module: libeTPkcs11.so" > usr/share/p11-kit/modules/safenet-etoken.module

  mkdir -p usr/share/applications
  cp -a usr/share/eToken/shortcuts/etProps.desktop usr/share/applications/

  mkdir -p usr/share/pixmaps
  cp -a usr/share/eToken/shortcuts/icons/etProps.png usr/share/pixmaps/

  mkdir -p usr/lib/systemd/system
  cp -a "$srcdir"/eTSrv.service usr/lib/systemd/system/
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
