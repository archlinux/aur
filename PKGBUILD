# Maintainer: prabinpanta0 <me@prabinpanta.com.np>
pkgname=aeth-git
pkgver=r21.a99d56d
pkgrel=1
pkgdesc="An elegant polymorphic shell that lacks the concept of elegance. Written in Haskell."
arch=('x86_64')
url="https://github.com/prabinpanta0/Aeth"
license=('MIT')
depends=('gmp' 'ncurses' 'zlib' 'libffi')
makedepends=('ghc' 'ghc-static' 'cabal-install' 'git')
provides=('aeth')
conflicts=('aeth')
source=("${pkgname}::git+https://github.com/prabinpanta0/Aeth.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # Attempt to use git describe, fallback to count.hash
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"

  # Use a local home directory for cabal to avoid messing with user's config
  mkdir -p "$srcdir/home/.cabal"
  export HOME="$srcdir/home"

  cabal update
  
  # Force cabal to ignore system dynamic libraries and build static versions from source
  # This fixes "Could not find module" errors for static builds on Arch Linux where global packages are dynamic-only
  # We do NOT include 'text' here as it is a boot library and static versions should be provided by ghc-static
  local constraints=(
    --constraint "hashable source"
    --constraint "random source"
    --constraint "os-string source"
    --constraint "splitmix source"
    --constraint "primitive source"
    --constraint "vector source"
    --constraint "scientific source"
    --constraint "unordered-containers source"
    --constraint "case-insensitive source"
    --constraint "async source"
    --constraint "split source"
  )

  # Build with optimization and stripping
  # --disable-shared --enable-static ensures we build static libraries for dependencies
  cabal build --enable-executable-stripping \
              --enable-split-sections \
              --disable-shared \
              --enable-static \
              "${constraints[@]}"
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Specify HOME again just in case makefile invokes cabal and needs it
  export HOME="$srcdir/home"

  # Install the pre-built executable (do not rebuild during package())
  # Find the built executable under dist-newstyle. New-build layout places
  # the executable under nested directories (e.g. */x/aeth/build/aeth/aeth).
  # Search for an executable file named 'aeth' to be robust across layouts.
  local binpath
  binpath="$(find dist-newstyle -type f -name aeth -perm /111 -print -quit)"
  if [[ -z "$binpath" ]]; then
    echo "ERROR: built executable not found under dist-newstyle" >&2
    echo "Tried: find dist-newstyle -type f -name aeth -perm /111" >&2
    return 1
  fi
  install -Dm755 "$binpath" "$pkgdir/usr/bin/aeth"

  # Install License (Mandatory for Arch)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install Documentation and Example Config
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  if compgen -G "docs/*.md" > /dev/null; then
    install -Dm644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/"
  fi
  install -Dm644 config/config.toml "$pkgdir/usr/share/doc/$pkgname/examples/config.toml"
}
