# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon-isolated
pkgver=3.25.2
pkgrel=2
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way - Use dns_lexicon namespace to avoid conflict with python-lexicon"
arch=(any)
url="https://github.com/dns-lexicon/dns-lexicon"
license=(MIT)
depends=(
  python-beautifulsoup4
  python-cryptography
  python-yaml
  python-requests
  python-requests-unixsocket
  python-tldextract
  python-importlib-metadata
  python-pyotp
  python-dnspython
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-vcrpy
  python-boto3
  python-localzone
  python-softlayer
  python-zeep
  bind
)
optdepends=(
  'python-boto3: for Route53 support'
  'python-localzone: for localzone support'
  'python-softlayer: for SoftLayer support'
  'python-zeep: for Gransy support')
  # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
  # 'python-tencentcloud-sdk-python: for QCloud support'

source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('37a397378488deb0eff593e285cd13df7119c67c15061d635f40ccfdc3d00a70263fde0b3c5bb53a5301fd0e41682aaec60b77ef0164fa3e39173760bfb4698f')
b2sums=('44b0aedac30daafe78596e2a5531283cceadf83a5036d768ee6979fe7a1285292dde4dbff3af521f585452a45f7d0e9dca1c74a5a07b932f3acb7f9f4e576e31')

prepare() {
    cd "$pkgname"

    # Rename package
    mv src/lexicon src/dns_lexicon

    # Rewrite python references to lexicon.X
    find src tests -type f -name '*.py' -exec sed -i \
        -e 's/\bfrom lexicon\b/from dns_lexicon/g' \
        -e 's/\bimport lexicon\b/import dns_lexicon/g' \
        -e 's/\blexicon\./dns_lexicon./g' \
        {} +

    # Revert some renames : test domain name, config file extension, ...
    find src tests -type f -name '*.py' -exec sed -i -E \
        -e 's/\bdns_lexicon\.(yml|yaml|json|toml|cfg|ini|tests|com|net|org|io|fr|local|example)\b/lexicon.\1/g' \
        {} +

    # pyproject.toml
    sed -i \
        -e 's|"src/lexicon"|"src/dns_lexicon"|' \
        -e 's|"lexicon\._private\.cli:main"|"dns_lexicon._private.cli:main"|' \
        -e 's|--cov=lexicon|--cov=dns_lexicon|' \
        -e 's|^lexicon = |dns-lexicon = |' \
        pyproject.toml
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD/src" pytest --ignore=tests/providers/test_transip.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
