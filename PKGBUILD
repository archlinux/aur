# Maintained in the Admoneo upstream checkout.
pkgname=admoneo
pkgver=1.0.0
pkgrel=1
pkgdesc='Local reminders with a natural-language REPL, deterministic CLI and TUI'
arch=('x86_64')
# Public upstream and license metadata.
url="https://github.com/ImJstNickDev/admoneo"
license=("MIT")
depends=('glibc' 'libgcc' 'sqlite' 'systemd' 'dbus')
makedepends=('cargo' 'pkgconf')
optdepends=('ca-certificates: system trust roots for HTTPS delivery'
            'openai-codex: natural-language REPL with Codex-managed ChatGPT authentication'
            'polkit: optional wake-from-suspend authorization'
            'xdg-utils: open stored reminder URLs')
options=('!lto')
_srcname="admoneo-$pkgver"
# Immutable public v1.0.0 archive URL and SHA-256.
_archive_url='https://github.com/ImJstNickDev/admoneo/archive/refs/tags/v1.0.0.tar.gz'
_archive_sha256='f12a165ff45fffcbd53b7f24c3371429b2bc0eec3a9aa64eecea2908dd70b5b2'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f12a165ff45fffcbd53b7f24c3371429b2bc0eec3a9aa64eecea2908dd70b5b2")
if [[ -n $_archive_url && -n $_archive_sha256 ]]; then
  source=("$pkgname-$pkgver.tar.gz::$_archive_url")
  sha256sums=("$_archive_sha256")
fi

prepare() {
  if [[ -z $_archive_url || ! $_archive_sha256 =~ ^[0-9a-f]{64}$ ]]; then
    error 'Unpublished source: set the immutable release archive URL and real SHA-256'
    return 1
  fi
  cd "$_srcname"
  cargo fetch --locked
}

build() {
  cd "$_srcname"
  cargo build --frozen --release
}

check() {
  cd "$_srcname"
  cargo test --frozen --all-targets
}

package() {
  cd "$_srcname"
  DESTDIR="$pkgdir" ./packaging/install.sh target/release
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
