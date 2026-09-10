# Maintained in the Admoneo upstream checkout.
pkgname=admoneo-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Local reminders with a natural-language REPL, deterministic CLI and TUI'
arch=('x86_64')
# Public upstream and license metadata.
url="https://github.com/ImJstNickDev/admoneo"
license=("MIT")
depends=('glibc' 'libgcc' 'sqlite' 'systemd' 'dbus')
makedepends=('cargo' 'pkgconf' 'git')
optdepends=('ca-certificates: system trust roots for HTTPS delivery'
            'openai-codex: natural-language REPL with Codex-managed ChatGPT authentication'
            'polkit: optional wake-from-suspend authorization'
            'xdg-utils: open stored reminder URLs')
options=('!lto')
provides=("admoneo=${pkgver}")
conflicts=("admoneo")
_srcname=admoneo
# Public Git repository URL. Development branch is main.
_git_url='https://github.com/ImJstNickDev/admoneo.git'
source=("admoneo::git+https://github.com/ImJstNickDev/admoneo.git#branch=main")
sha256sums=("SKIP")
if [[ -n $_git_url ]]; then
  source=("admoneo::git+$_git_url#branch=main")
  sha256sums=('SKIP')
fi

pkgver() {
  cd "$_srcname"
  local description
  if description=$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null); then
    printf '%s\n' "$description" | sed 's/^v//;s/-\([0-9]*\)-g/.r\1.g/'
  else
    local version
    version=$(sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -n1)
    printf '%s.r%s.g%s\n' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  if [[ -z $_git_url ]]; then
    error 'Unpublished source: set the public upstream Git URL'
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
