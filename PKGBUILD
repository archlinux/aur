# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-git
pkgver=2.4.rc2.r864.g3b1ded39
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) - git checkout'
arch=('i686' 'x86_64')
url='https://openvpn.net/index.php/open-source.html'
license=('custom')
depends=('openssl' 'lzo' 'lz4' 'systemd-libs' 'libsystemd.so' 'pkcs11-helper' 'libpkcs11-helper.so')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd' 'python-docutils')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.4.0' 'openvpn-dev')
install=openvpn.install
# for 2.5.x release branch append: #branch=release/2.5
source=("git+https://github.com/OpenVPN/openvpn.git"
        '0001-unprivileged.patch'
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('SKIP'
            '8e7d292514f30729bc37d6681789b1bfdf87a992a3aa77e2a28b8da9cd8d4bfe'
            '3646b865ac67783fafc6652589cfe2a3105ecef06f3907f33de5135815f6a621'
            'b1436f953a4f1be7083711d11928a9924993f940ff56ff92d288d6100df673fc')

pkgver() {
  cd "${srcdir}"/openvpn

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    printf '%s.r%s.g%s' \
      "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
      "$(git rev-list --count ${GITTAG}..)" \
      "$(git rev-parse --short HEAD)"
  else
    printf '0.r%s.g%s' \
      "$(git rev-list --count master)" \
      "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "${srcdir}"/openvpn

  # https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg19302.html
  sed -i '/^CONFIGURE_DEFINES=/s/set/env/g' configure.ac

  # start with unprivileged user and keep granted privileges
  patch -Np1 < ../0001-unprivileged.patch

  autoreconf --force --install
}

build() {
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build

  "${srcdir}"/openvpn/configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-pkcs11 \
    --enable-plugins \
    --enable-systemd \
    --enable-x509-alt-username
  make
}

check() {
  cd "${srcdir}"/build

  make check
}

package() {
  cd "${srcdir}"/build

  # Install openvpn
  make DESTDIR="${pkgdir}" install

  # Install sysusers and tmpfiles files
  install -D -m0644 ../sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/openvpn.conf
  install -D -m0644 ../tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/openvpn.conf

  # Install license
  install -d -m0755 "${pkgdir}"/usr/share/licenses/openvpn/
  ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/openvpn/

  cd "${srcdir}"/openvpn

  # Install examples
  install -d -m0755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

  # Install contrib
  for FILE in $(find contrib -type f); do
    case "$(file --brief --mime-type --no-sandbox "${FILE}")" in
      "text/x-shellscript")
        install -D -m0755 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
      *)
        install -D -m0644 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
    esac
  done
}
