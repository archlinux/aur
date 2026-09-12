pkgname=python-flanker
pkgver=0.9.16
pkgrel=1
pkgdesc='Mailgun MIME and email parsing library'
arch=('any')
url='https://github.com/mailgun/flanker'
license=('Apache-2.0')

depends=(
  'python'
  'python-attrs'
  'python-chardet'
  'python-cryptography'
  'python-idna'
  'python-ply'
  'python-regex'
  'python-six'
  'python-standard-imghdr'
  'python-tld'
  'python-webob'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=("https://github.com/mailgun/flanker/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df9df81eada6035a857ff49f3a131c372b3519baa40f57949ef6f377936f7be4')

build() {
  cd "flanker-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "flanker-${pkgver}"

  rm -rf "$srcdir/test-install"

  python -m installer \
    --destdir="$srcdir/test-install" \
    dist/*.whl

  local site_packages
  site_packages="$(python - <<'PY'
import sysconfig
print(sysconfig.get_path("purelib").lstrip("/"))
PY
)"

  PYTHONPATH="$srcdir/test-install/$site_packages" \
    python - <<'PY'
from flanker import mime
from flanker.addresslib import address

msg = mime.from_string(
    "From: Alice <alice@example.com>\r\n"
    "To: Bob <bob@example.net>\r\n"
    "Subject: Flanker smoke test\r\n"
    "\r\n"
    "Hello from Python 3.14.\r\n"
)

assert msg.headers["Subject"] == "Flanker smoke test"

parsed = address.parse("Alice <alice@example.com>")
assert parsed.address == "alice@example.com"

print("Flanker MIME parsing OK")
print("Flanker address parsing OK")
PY
}

package() {
  cd "flanker-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
