# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=maddy-git
pkgver=0.1
pkgrel=5
pkgdesc="Fast, cross-platform mail server"
arch=(any)
url="https://github.com/emersion/maddy"
license=('MIT')
makedepends=('git' 'go' 'scdoc')
source=("git+https://github.com/emersion/maddy.git"
	"git+https://github.com/foxcpp/go-imap-sql.git"
	"maddy.sysusers"
	"maddy.tmpfiles"
	"maddy.service")
conflicts=("maddy")
provides=("maddy")
backup=('etc/maddy/maddy.conf')
sha512sums=('SKIP'
	    'SKIP'
	    '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
	    'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5'
	    '34e63fd415ed225bdf0a974523cc4d903b1c25ebf5d3c8a7e9bbfe48cb7fe5019f79f4ff058e463d54c996cfdec31c456c155a525a9bbb76ab05a2ef920f95fa')

pkgver() {
  cd "maddy"
  echo "0.1"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/maddy"
  export GOPATH="${srcdir}"
  export GO111MODULE=on
  go get -v

  cd "${srcdir}/go-imap-sql"
  go get -v
}

build() {
  cd "${srcdir}/maddy"
  export GOPATH="${srcdir}"
  export GO111MODULE=on
  go build -v
  scdoc < maddy.conf.5.scd > maddy.conf.5
  scdoc < maddy.1.scd > maddy.1
  gzip -c maddy.conf.5 > "maddy.conf.5.gz"
  gzip -c maddy.1 > "maddy.1.gz"
  cd cmd/maddy
  go build -v

  cd "${srcdir}/go-imap-sql/cmd/imapsql-ctl"
  go build -v
}

package() {
  install -Dm 0755 "${srcdir}/maddy/cmd/maddy/maddy" "${pkgdir}/usr/bin/maddy"
  install -Dm 0755 "${srcdir}/go-imap-sql/cmd/imapsql-ctl/imapsql-ctl" "${pkgdir}/usr/bin/imapsql-ctl"
  install -D "${srcdir}/maddy/LICENSE" "${pkgdir}/usr/share/licenses/maddy/LICENSE"

  install -Dm 0644 "${srcdir}/maddy/maddy.conf" "${pkgdir}/etc/maddy/maddy.conf"
  install -Dm 0644 "${srcdir}/maddy/maddy.1.gz" "${pkgdir}/usr/share/man/man1/maddy.1.gz"
  install -Dm 0644 "${srcdir}/maddy/maddy.conf.5.gz" "${pkgdir}/usr/share/man/man5/maddy.conf.5.gz"

  install -Dm 0644 "${srcdir}/maddy.service" "${pkgdir}/usr/lib/systemd/system/maddy.service"
  install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
  install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
