# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=helpme
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool for looking up emergency and non-emergency numbers'
arch=('x86_64')
url='https://github.com/DavidCanHelp/helpme'
license=('LicenseRef-MIT-helpme')
depends=('glibc')
makedepends=('go')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/DavidCanHelp/helpme/archive/v${pkgver}.tar.gz"
  'github-pr-2.patch'
  'github-pr-3.patch'
  # From README.txt
  'LicenseRef-MIT-helpme.txt'
)

sha512sums=(
  '6ef3a99fadbf540ef35376df8c8d80e1fda7f002d5f1446dd3c09c7c94800de70380a138b823f8961da4e44a3d204295666e288222c2caa6d1f89e5e7d311f63'
  '9185f899b49c1ff74e047bd3cee7cca7a660c05696c1fb55dddaccbd19785f691b0abdcb7a5aed5896a50ef021471331e7f2949dd29e8a62f1d822aedd680142'
  '3fce3e5e05b20634ae6338e62e1a0131458fd0506ee140b658d7deed446054a1ce8081f4e6580bd24e0e058452690bbc1479e04cfad521624b0abf11d5da581a'
  '05a2580c2282bb7d2489f84184bbf58ab71baa6faf3f1be5ffe29d469b5528a73d306dd8205efb4e4ddf887de33f8853783eaff475e1a3e4b17cc7ce6a0a8b50'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  # Remove the following patches once the upstream author has merged
  # PRs 2 and 3, respectively, and included them in a stable release.
  # See also:
  # - https://github.com/DavidCanHelp/helpme/pull/2
  # - https://github.com/DavidCanHelp/helpme/pull/3
  #
  echo >&2 'Applying patch to add resources for Germany, federal level'
  patch -p1 < ../github-pr-2.patch
  echo >&2 'Applying patch to fix ragged alignment of menu item labels'
  patch -p1 < ../github-pr-3.patch

  echo >&2 'Adjusting relative path to resources'
  sed -i -e 's/"data"/"..", "share", "helpme"/' internal/data/resources.go

  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Testing the executable'
  build/helpme emergency -l de > actual.txt
  if ! grep -q '^General\W*112$' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" build/*

  echo >&2 'Packaging the raw data files'
  install -d "${pkgdir}/usr/share"
  cp -vR data "${pkgdir}/usr/share/${pkgname}"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    ../LicenseRef-MIT-helpme.txt
}
