# Maintainer: William Smith <calsignlabs at gmail dot com>

pkgname=python-revup
pkgver=0.3.0
pkgrel=1
pkgdesc="Effortlessly create and manage pull requests without changing branches. Powers a stacked diffs workflow with python and git 'plumbing' commands."
arch=("any")
url="https://github.com/Skydio/revup"
license=("MIT")
depends=(
    python
    python-aiohttp
    python-async-lru
    python-attrs
    python-requests
    python-rich
    python-multidict
    python-yarl
    python-async-timeout
    python-charset-normalizer
    python-aiosignal
    git
)
makedepends=(
    make
    python-setuptools
    python-wheel
    python-pip
    python-build
    python-installer
    pandoc-cli
    gzip
    coreutils
    gawk
)
source=("${pkgname}::git+https://github.com/Skydio/revup#tag=v$pkgver")
sha256sums=('a541814dbfec5d261c9f263dd203cf3340141af21e5264169708d69f26a53566')

build() {
  cd python-revup
  make package
}

package() {
  cd python-revup
  python -m installer --destdir="$pkgdir" build/*.whl

  mkdir -p "${pkgdir}/usr/share/man/man1"
  for f in revup/man1/*.1.gz; do
      base="$(basename ${f})"
      if [ "${base}" = "revup.1.gz" ]; then
          newname="${base}"
      else
          newname="revup-${base}"
      fi
      cp "$f" "${pkgdir}/usr/share/man/man1/${newname}"
  done
}
