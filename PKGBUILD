# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=pkgupd-git
_pkgname=pkgupd
pkgver=0.37
pkgrel=1
pkgdesc="Checks repositories and AUR for package updates"
arch=('i686' 'x86_64')
url="https://github.com/foucault/pkgupd"
license=('GPL3')
provides=('pkgupd')
conflicts=('pkgupd')
makedepends=('go>=1.3' 'git' 'perl')
optdepends=('python: for the default cli client')
options=('!strip')
source=("${_pkgname}::git://github.com/foucault/${_pkgname}")
backup=('etc/conf.d/pkgupd')
_gogets=("github.com/jessevdk/go-flags"
	"github.com/go-fsnotify/fsnotify")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo "0.$(git rev-list --count master)"
}

prepare() {
  mkdir -p ${srcdir}/godeps
  msg "Getting GO dependencies"
  for dep in ${_gogets[@]}; do
    msg2 "Go getting ${dep}"
    GOPATH=${srcdir}/godeps go get -v ${dep}
  done
  if [[ -e ${srcdir}/godeps/src/${_pkgname} ]]; then
    if [[ -h ${srcdir}/godeps/src/${_pkgname} ]]; then
      unlink ${srcdir}/godeps/src/${_pkgname}
    else
      error "${srcdir}/godeps/src/${_pkgname} should be a link"
    fi
  fi
  ln -s ${srcdir}/${_pkgname} ${srcdir}/godeps/src
}

build() {
  msg "Building glue library"
  cd ${srcdir}/${_pkgname}/alpm
  make

  msg "Building pkgupd"
  cd ${srcdir}
  GOPATH=${srcdir}/godeps \
    LIBRARY_PATH=${srcdir}/${_pkgname}/alpm \
    go install -v pkgupd/pkgupd

  msg "Building man page"
  cd ${srcdir}/${_pkgname}
  _version=$(pkgver)
  pod2man --utf8 --center="Pkgupd Manual" --release="pkgupd ${_version}" \
    --section=8 pkgupd.pod > pkgupd.8
  gzip pkgupd.8

}

package() {
  cd ${srcdir}/${_pkgname}
  install -D -m755 ${srcdir}/godeps/bin/pkgupd \
    ${pkgdir}/usr/bin/pkgupd
  install -D -m755 ${srcdir}/${_pkgname}/alpm/libgoalpm.so \
    ${pkgdir}/usr/lib/libgoalpm.so
  install -D -m644 ${srcdir}/${_pkgname}/pkgupd.service \
    ${pkgdir}/usr/lib/systemd/system/pkgupd.service
  install -D -m644 ${srcdir}/${_pkgname}/tmpfiles.pkgupd.conf \
    ${pkgdir}/usr/lib/tmpfiles.d/pkgupd.conf
  install -D -m644 ${srcdir}/${_pkgname}/pkgupd.conf.d \
    ${pkgdir}/etc/conf.d/pkgupd
  install -D -m755 ${srcdir}/${_pkgname}/pkgupd_cli.py \
    ${pkgdir}/usr/bin/pkgupd_cli
  install -D -m755 ${srcdir}/${_pkgname}/upkg.sh \
    ${pkgdir}/usr/bin/upkg
  install -D -m644 ${srcdir}/${_pkgname}/pkgupd.8.gz \
    ${pkgdir}/usr/share/man/man8/pkgupd.8.gz
}

# vim:ts=2:et:sw=2
