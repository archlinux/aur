# Maintainer: fhw <fhw AT riseup DOT net>
pkgname=solanum-ircd-git
_pkgname=solanum-ircd
pkgver=r4103.d03347cb
pkgrel=1
pkgdesc='An IRCd for unified networks'
arch=('x86_64')
url='https://solanum.chat/'
license=('GPL2')
depends=('libtool' 'libxcrypt' 'openssl' 'sqlite')
makedepends=('bison' 'flex' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/solanum/ircd.conf' 'etc/solanum/ircd.motd')
source=("${_pkgname}::git+https://github.com/solanum-ircd/solanum"
        'fix-config.diff'
        'solanum.logrotate'
        'solanum.service'
        'solanum.sysusers'
        'solanum.tmpfiles')
b2sums=('SKIP'
        'c947966ec46dd87d1087b4b90716c6f0ecbff3806d40085a22d8fcb5a2d6b7876f9b10c56ceef067dbbd4898eaeaf171f10f93d003a2a966e9927f1dbfec1def'
        'b534ea99ad816a254cb2a62558a99debd88f7676d1729a528c8180a2ea1aa0526f200c0801a66174f03f4aa28cccac62b7f77fd31ce33ddbe4772497c2ff944f'
        '6dbc67b99eba89e8fbb130fea244f8c7fb992322f100683407d3850d963b1a7b6304c8af21a1fcfbfb5bf3c1f78bdea160c838e0c30befa062bc4958fcf00739'
        '47c65608bcf43dded9af8a3f7221d57768ea3a51486721914285398522a12fcc3d0f7595941013f7353ca4c9565b0a0d3ceaa6a502acfd82d1a3468e2179edbe'
        'a5be155fbf6f5241173484db6df5cf7c570d710a7c33bb2e72ac9164fe68b9147edea33b9cad5af249fca3c308684785a3984e0d93eb7302cc5b0291eadfca37')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i "${srcdir}/fix-config.diff"
  sed -i 's|${localstatedir}/${PACKAGE_TARNAME}|${localstatedir}/lib/${PACKAGE_TARNAME}|' configure.ac
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure \
    --prefix=/usr \
    --with-program-prefix=solanum- \
    --enable-fhs-paths \
    --localstatedir=/var \
    --sysconfdir=/etc/solanum \
    --libexecdir=/usr/lib \
    --with-helpdir=/usr/share/doc/solanum/help \
    --with-rundir=/run \
    --enable-openssl
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/solanum/ircd.conf.example" "${pkgdir}/etc/solanum/ircd.conf"
  rm "${pkgdir}/etc/solanum/reference.conf"
  install -Dm644 "${srcdir}/solanum.logrotate" "${pkgdir}/etc/logrotate.d/solanum"
  install -Dm644 "${srcdir}/solanum.service" "${pkgdir}/usr/lib/systemd/system/solanum.service"
  install -Dm644 "${srcdir}/solanum.sysusers" "${pkgdir}/usr/lib/sysusers.d/solanum.conf"
  install -Dm644 "${srcdir}/solanum.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/solanum.conf"

  # docs
  rm -f "doc/"{,*/}"Makefile"{,.am,.in} "doc/oper-guide/.gitignore"
  cp -r doc "${pkgdir}/usr/share/doc/solanum/doc"
}

# vim: ts=2 sw=2 et:
