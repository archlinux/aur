# Maintainer: William Smith <calsignlabs at gmail dot com>

pkgname=python-revup
pkgver=0.4.0
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
    "git>=2.43"
)
makedepends=(
    make
    m4
    python-setuptools
    python-wheel
    python-pip
    python-build
    python-installer
    pandoc-cli
    gzip
    coreutils
    gawk
    git
)
source=("${pkgname}::git+https://github.com/Skydio/revup#tag=v$pkgver")
sha256sums=('42a2f8978d2dbafafdbe64f77f7ccddeab05040dcd84e3a1968be98ab7d7d7c3')

prepare() {
  cd "$pkgname"
  # Python 3.14 removed the implicit asyncio event loop. This version of revup isn't patched to
  # support python 3.14.
  sed -i 's|sys.exit(asyncio.get_event_loop().run_until_complete(main()))|sys.exit(asyncio.run(main()))|' revup/__main__.py
}

build() {
  cd python-revup
  make package
}

package() {
  cd python-revup
  python -m installer --destdir="$pkgdir" "build/revup-${pkgver}-py3-none-any.whl"

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
