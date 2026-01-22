# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>

pkgname=onionmine-git
pkgver=1.1.0.r353.gc02238c
pkgrel=1
pkgdesc='Onion Services keys and TLS certificates generator for vanity addresses'
arch=('x86_64')
url='https://gitlab.torproject.org/tpo/onion-services/onionmine'
license=('GPL-3.0-or-later')
install=${pkgname}.install
depends=(
  'tor'
  'curl'
  'rsync'
)
makedepends=(
  'git'
  'gcc'
  'make'
  'autoconf'
  'libsodium'
  'pcre2'
  'ruby'
)
optdepends=(
  'wipe: secure file deletion'
  'openbsd-netcat: for netcat support'
)
provides=('onionmine')
conflicts=('onionmine')
source=(
  "git+https://gitlab.torproject.org/tpo/onion-services/onionmine.git#branch=main"
)
sha256sums=('SKIP')

noextract=()

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.g%s" \
    "$(grep '^ONIONMINE_VERSION=' lib/params | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # Initialize git submodules
  git submodule sync --recursive
  git submodule update --init --recursive
}

build() {
  cd "${pkgname%-git}"

  # Build mkp224o
  cd vendor/mkp224o
  ./autogen.sh
  ./configure \
    --enable-intfilter=native \
    --enable-regex=yes \
    --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"

  # Install library files first (params and lists files needed by main script)
  install -d "$pkgdir/usr/lib/onionmine/lib"
  install -m755 lib/params "$pkgdir/usr/lib/onionmine/lib/"
  install -m755 lib/lists "$pkgdir/usr/lib/onionmine/lib/"
  install -m755 lib/batch "$pkgdir/usr/lib/onionmine/lib/"

  # Install bin scripts directory
  install -d "$pkgdir/usr/lib/onionmine/bin"
  install -m755 bin/* "$pkgdir/usr/lib/onionmine/bin/"

  # Install vendor files (onion-csr is for cert generation)
  install -d "$pkgdir/usr/lib/onionmine/vendor"
  cp -r vendor/onion-csr "$pkgdir/usr/lib/onionmine/vendor/"
  if [ -d "vendor/onion-mkdocs" ]; then
    cp -r vendor/onion-mkdocs "$pkgdir/usr/lib/onionmine/vendor/"
  fi

  # Install mkp224o source directory (for recompilation during runtime if needed)
  cp -r vendor/mkp224o "$pkgdir/usr/lib/onionmine/vendor/"

  # Install config files (both sample and as default)
  install -d "$pkgdir/etc/onionmine"
  install -m644 onionmine.conf.sample "$pkgdir/etc/onionmine/onionmine.conf.sample"

  # Install documentation
  install -d "$pkgdir/usr/share/doc/onionmine"
  install -m644 README.md "$pkgdir/usr/share/doc/onionmine/"
  install -m644 LICENSE "$pkgdir/usr/share/doc/onionmine/"
  install -m644 onionmine.conf.sample "$pkgdir/usr/share/doc/onionmine/"

  # Install example pool
  install -d "$pkgdir/usr/share/doc/onionmine/pools"
  cp -r pools/example.org "$pkgdir/usr/share/doc/onionmine/pools/"

  # Install main script
  install -Dm755 onionmine "$pkgdir/usr/bin/onionmine"

  # Patch main script to use fixed paths
  sed -i 's|^DIRNAME="`dirname \$0`"$|DIRNAME="/usr/lib/onionmine"|' "$pkgdir/usr/bin/onionmine"
  sed -i 's|^POOLS="\$DIRNAME/pools"$|POOLS="/var/lib/onionmine/pools"|' "$pkgdir/usr/bin/onionmine"

  # Patch lib/params to use /var/lib/onionmine/pools for subcommands
  sed -i 's|^BASEDIR=.*|BASEDIR="/usr/lib/onionmine"|' "$pkgdir/usr/lib/onionmine/lib/params"
  sed -i 's|^POOLS="\$BASEDIR/pools"|POOLS="/var/lib/onionmine/pools"|' "$pkgdir/usr/lib/onionmine/lib/params"
  sed -i 's|^ENV="\$BASEDIR/onionmine.conf"|ENV="/etc/onionmine/onionmine.conf"|' "$pkgdir/usr/lib/onionmine/lib/params"

  # Install state directories with group write permissions
  install -d -m 775 "$pkgdir/var/lib/onionmine"
  install -d -m 775 "$pkgdir/var/lib/onionmine/pools"

  # Install man page (if available, or create a simple one)
  install -d "$pkgdir/usr/share/man/man1"
  cat >"$pkgdir/usr/share/man/man1/onionmine.1" <<'EOF'
.TH ONIONMINE 1 "2025-01-22" "Onionmine 1.1.0"
.SH NAME
onionmine \- Onion Services keys and TLS certificates generator
.SH SYNOPSIS
.B onionmine
.RI <command> [options]
.SH DESCRIPTION
Onionmine is a wrapper for generating Tor onion service vanity addresses and managing
X.509 (TLS/HTTPS) certificates for those services.
.SH COMMANDS
.TP
.B mine <pool>
Generate onion service keys for the specified pool
.TP
.B generate <pool>
Generate a random onion service v3 key
.TP
.B config <pool>
Configure an onion service pool
.TP
.B select-candidate <pool>
Select a candidate from the generated pool
.TP
.B generate-selected-cert <pool>
Generate a certificate for the selected key
.TP
.B test-keys <pool>
Test the generated keys
.TP
.B check-dependencies
Check if all required dependencies are installed
.TP
.B install-dependencies
Install dependencies (Debian/Ubuntu only)
.SH CONFIGURATION
Main configuration file: /etc/onionmine/onionmine.conf
Pool directory: /var/lib/onionmine/pools/<pool-name>/
.SH FILES
.I /usr/bin/onionmine
Main executable
.br
.I /usr/lib/onionmine/
Library files and scripts
.br
.I /etc/onionmine/onionmine.conf
Main configuration file
.br
.I /var/lib/onionmine/pools/
Pool data directory
.SH SEE ALSO
.TP
.BR mkp224o (1)
.TP
.BR tor (1)
.SH AUTHOR
The Tor Project, Inc.
EOF

  gzip "$pkgdir/usr/share/man/man1/onionmine.1"
}
