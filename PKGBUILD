# Maintainer: Saisakthi <saisakthi@localhost>
pkgname=bountytool
pkgver=0.1.0
pkgrel=1
pkgdesc='End-to-end bug bounty reconnaissance, vulnerability triage and reporting suite'
arch=('x86_64' 'aarch64')
url='https://github.com/SaisakthiM/BountyTool'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
optdepends=(
  'nuclei: template based vulnerability scanning (nuclei stage)'
  'subfinder: passive subdomain enumeration (passive stage)'
  'httpx: HTTP probing and technology detection (probe stage)'
  'katana: crawling for endpoints and parameters (urls stage)'
  'ffuf: content and directory discovery (content stage)'
  'gobuster: content discovery fallback when ffuf is absent'
  'dalfox: XSS verification of reflected parameters'
  'sqlmap: SQL injection confirmation of native hits'
  'nmap: port and service discovery (deep profile, ports stage)'
  'naabu: fast port discovery before nmap'
  'findomain: second opinion on passive subdomains'
  'interactsh-client: out-of-band callbacks for blind SSRF (OAST)'
  'seclists: real wordlists for content discovery'
)
# makepkg's `lto` option appends `-flto` to CFLAGS, which makes the C code in
# dependencies such as `ring` GCC LTO bitcode (`.gnu.lto_*` sections, empty
# `.text`). The final link is driven by rust-lld, which cannot read GCC's
# bitcode, so every C symbol in that archive goes undefined. Rust's own ThinLTO
# from the release profile is unaffected by this option.
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7d13b0d041eb0b762c48f64a455a321152ea94c09b3f86a0536b2ceb11a4bd13')

# The GitHub repository is `BountyTool` but the package is `bountytool`. GitHub
# names tag archives after the repository, so the extracted directory never
# matches $pkgname-$pkgver on a case-sensitive filesystem: every function has to
# cd into the real path.
_repo=BountyTool

# The engine degrades gracefully, but a scan without the core scanners is not
# worth running. `bountytool doctor --install` installs them afterwards.
# Optional scanners are listed in optdepends so pacman can pull them on request.

prepare() {
  cd "$_repo-$pkgver"
  # Populate the crate cache so the build below can run fully offline.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_repo-$pkgver"
  export CARGO_TARGET_DIR=target
  make CARGO_FLAGS="--frozen"
}

# `check()` is intentionally omitted: the pipeline drives external scanners that
# are runtime dependencies, not build dependencies, so the suite is verified
# with `cargo test` by the packager rather than under fakeroot.

package() {
  cd "$_repo-$pkgver"
  make install CARGO_FLAGS="--frozen" DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
