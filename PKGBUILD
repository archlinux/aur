# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Mattias Andersson <contact@stablemate.se>

pkgname="playwright"
pkgver=1.59.1
pkgrel=2
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=("any")
url="https://playwright.dev"
license=("Apache-2.0")
depends=("nodejs" "icu" "libwebp" "pcre" "libffi" "flite")
makedepends=("npm")
optdepends=(
  "chromium: for chromium support"
  "firefox: for firefox support"
)
provides=("playwright")
conflicts=("python-playwright")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('62a222f609403fc6253633420d7fa8936430bdc19fd9e571423fc47d2ab6190bb1f1c0d46a933f25118fdc4b5d2edb99d935bb1c051e1e433e8a274f13e026f0')

package(){
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
  npm install \
    --global \
     --prefix "$pkgdir/usr" \
     "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tar.gz"

  # --- CONFIGURATION AUTOMATIC ARCH LINUX ---
  install -dm755 "$pkgdir/etc/profile.d"
  cat << 'EOF' > "$pkgdir/etc/profile.d/$pkgname.sh"
# Tell Playwright to skip downloading bundled browsers
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Tell Playwright to use system browsers natively
export PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH=/usr/bin/chromium
export PLAYWRIGHT_FIREFOX_EXECUTABLE_PATH=/usr/bin/firefox
EOF
  chmod 755 "$pkgdir/etc/profile.d/$pkgname.sh"
  # --------------------------------------------------

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}

post_install() {
    echo -e "\e[1;34m==>\e[1;37m Playwright has been configured to use Arch Linux system browsers automatically."
    echo -e "\e[1;34m==>\e[1;37m Please \e[1;33mrestart your terminal\e[1;37m or run \e[1;33msource /etc/profile.d/playwright.sh\e[1;37m to apply the environment variables.\e[0m"
}

post_upgrade() {
    post_install
}
