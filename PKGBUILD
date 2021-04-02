# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=autorecon-git
_gitname='autorecon'
pkgver=r75.be8ca67
pkgrel=1
pkgdesc='Multi-threaded network reconnaissance tool which performs automated enumeration of services.'
arch=(any)
url='https://github.com/Tib3rius/AutoRecon'
license=(GPL)
depends=('python-colorama' 'python-toml' 'python-appdirs')
makedepends=('python-poetry' 'python-setuptools' 'git')
optdepends=('seclists-git'
            'enum4linux'
            'gobuster'
            'nbtscan'
            'nikto'
            'nmap'
            'onesixtyone'
            'oscanner'
            'smbclient'
            'smbmap'
            'smtp-user-enum'
            'net-snmp'
            'sslscan'
            'sipvicious'
            'tnscmd10g'
            'whatweb'
            'wkhtmltopdf')
conflicts=(autorecon)
provides=(autorecon)
source=("${_gitname}::git+https://github.com/Tib3rius/AutoRecon.git"
        'autorecon.sh')
sha256sums=('SKIP'
            '90b36035e98bffbe2fe7e9a504fa7c6b17bf22d231cf6daea102e5ec055737fe')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  
  python -m poetry build
  cd dist
  tar zxf ${_gitname}-*.tar.gz
  cd ${_gitname}-1.0.0
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_gitname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}/"

  cd dist/${_gitname}-1.0.0
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


# vim:set ts=2 sw=2 et:
