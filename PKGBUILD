# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

branch=loki # This variable can be set to any development branch
pkgname=asbru-cm-${branch}${branch:+-}git
_pkgname=asbru
_fpkgname=asbru-cm
pkgver=6.1.0rc2.r64.g14ab3ac
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="A free and open-source connection manager. ${branch:-master} branch"
url="https://github.com/asbru-cm/asbru-cm"
depends=('perl' 'vte3' 'cairo-perl' 'glib-perl' 'pango-perl' 'perl-socket6' 'perl-expect' 'perl-yaml' 'perl-crypt-cbc' 'perl-crypt-blowfish' 'perl-gtk3' 'perl-net-arp'
         'uuid' 'openssh' 'inetutils' 'perl-crypt-rijndael' 'perl-xml-parser' 'libcanberra' 'perl-gtk3-simplelist' 'libwnck3' 'perl-io-stty' 'perl-io-tty')
optdepends=('uucp: Unix-to-Unix Copy' 'rdesktop: RDP connections' 'freerdp: RDP connections' 'openssh: SSH connections' 'mosh: Mobile shell' 'tigervnc: for VNC connections'
            'perl-x11-guitest: To fit perfectly RDP tabs')
makedepends=('git')
#conflicts=()
[ -z ${branch} ] && source=("git+https://github.com/asbru-cm/asbru-cm.git") || source=("git+https://github.com/asbru-cm/asbru-cm.git#branch=${branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_fpkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

if ! [ -z ${branch} ]; then
  build() {
        cd "${_fpkgname}"
        sed -e "s/Exec=.*${_fpkgname}/&-${branch}/g" -e "s/Name=Ásbrú.*/& (${branch})/g" -e "s/Icon=${_fpkgname}/&-${branch}/g" -i res/${_fpkgname}.desktop
  }
fi

package() {
  cd "${_fpkgname}"

  # /etc stuff
  mkdir -p "$pkgdir"/etc/bash_completion.d
  install -Dm644 res/${_pkgname}_bash_completion "${pkgdir}"/etc/bash_completion.d/${_pkgname}${branch:+-}${branch}_bash_completion

  # /opt stuff
  mkdir -p "$pkgdir"/opt/${_fpkgname}${branch:+-}${branch}/{res,utils,lib}
  install -Dm644 res/{*png,*svg,*glade,*yml,*jpg,*css} "${pkgdir}"/opt/${_fpkgname}${branch:+-}${branch}/res/ || true
  cp -rp res/themes "${pkgdir}"/opt/${_fpkgname}${branch:+-}${branch}/res/ || true
  install -Dm644 utils/* -t "${pkgdir}"/opt/${_fpkgname}${branch:+-}${branch}/utils/
  cp -rp lib/* "${pkgdir}"/opt/${_fpkgname}${branch:+-}${branch}/lib/
  install -m755 asbru-cm "${pkgdir}"/opt/${_fpkgname}${branch:+-}${branch}/${_fpkgname}${branch:+-}${branch}

  # /usr stuff
  mkdir -p "$pkgdir"/usr/share/{pixmaps,man/man1,applications} "$pkgdir"/usr/bin
  install -Dm644 res/${_pkgname}-logo-64.png "${pkgdir}"/usr/share/pixmaps/${_fpkgname}${branch:+-}${branch}.png
  install -Dm644 res/${_fpkgname}.desktop "${pkgdir}"/usr/share/applications/${_fpkgname}${branch:+-}${branch}.desktop
  install -Dm644 res/${_fpkgname}.1 "${pkgdir}"/usr/share/man/man1/${_fpkgname}${branch:+-}${branch}.1
  ln -sf /opt/${_fpkgname}${branch:+-}${branch}/${_fpkgname}${branch:+-}${branch} "$pkgdir"/usr/bin/${_fpkgname}${branch:+-}${branch}
}


