# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=easycrypt-bin
pkgver=2026.09
pkgrel=1
pkgdesc="Interactive framework for cryptographic proofs (EasyCrypt)"
arch=('x86_64')
url="https://github.com/EasyCrypt/easycrypt"
license=('MIT')

# Prebuilt, already-stripped binaries: skip strip/debug to avoid
# "gdb-add-index: No index was created" noise and an empty -debug package
options=('!strip' '!debug' '!lto')

# Runtime dependencies available in official repositories
depends=(
  'ocaml'
  'gmp'
  'mpfr'
  'why3-bin'
)

# Tools required to extract the Debian package
makedepends=('binutils' 'tar')

# Debian packages
_pkgname=easycrypt

# Debian version string used in the source URL
_debver="${pkgver}-1"

source=(
  "${_pkgname}_${_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/e/easycrypt/${_pkgname}_${_debver}_amd64.deb"
  "easycrypt.sh"
)

sha256sums=('a5a19fccaaecd6225ee972eed23bce2b81efe6007300f3a8c644f013ad0c0982'
            'f389fa8ea5c44e872069cfac7b2320b1108442b3efbfc93dda8a9c8d9bca8ed3')

package() {
  cd "$srcdir"

  # Extract the Debian package
  ar x "${_pkgname}_${_debver}_amd64.deb"

  # Extract the data archive (format may vary)
  if [ -f data.tar.xz ]; then
    tar -xf data.tar.xz -C "$pkgdir"
  elif [ -f data.tar.gz ]; then
    tar -xf data.tar.gz -C "$pkgdir"
  elif [ -f data.tar.zst ]; then
    tar -xf data.tar.zst -C "$pkgdir"
  fi

  # The binary has why3server's path baked in under Debian's OCaml 5.3.0
  # libdir, while why3-bin installs it elsewhere. Install the real binary
  # behind a wrapper that sets WHY3LIB to a directory linking why3-bin's
  # helper executables.
  local _why3lib
  _why3lib="$(why3 --print-libdir)"
  mv "$pkgdir/usr/bin/easycrypt" "$pkgdir/usr/lib/easycrypt/easycrypt"
  install -Dm755 easycrypt.sh "$pkgdir/usr/bin/easycrypt"
  install -dm755 "$pkgdir/usr/lib/easycrypt/why3lib"
  ln -s "$_why3lib/why3server" "$pkgdir/usr/lib/easycrypt/why3lib/why3server"
  ln -s "$_why3lib/why3cpulimit" "$pkgdir/usr/lib/easycrypt/why3lib/why3cpulimit"

  # Remove Debian-specific changelog files
  if [ -d "$pkgdir/usr/share/doc/$_pkgname" ]; then
    rm -f "$pkgdir/usr/share/doc/$_pkgname/changelog.Debian"*
  fi

  # Install the MIT license under the package's own name.
  # The Debian copyright file is empty, so use the real LICENSE shipped
  # in the docs directory and fall back to copyright only if it is missing.
  if [ -s "$pkgdir/usr/doc/$_pkgname/LICENSE" ]; then
    install -Dm644 \
      "$pkgdir/usr/doc/$_pkgname/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -s "$pkgdir/usr/share/doc/$_pkgname/copyright" ]; then
    install -Dm644 \
      "$pkgdir/usr/share/doc/$_pkgname/copyright" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Drop the empty Debian copyright stub
  rm -f "$pkgdir/usr/share/doc/$_pkgname/copyright"
  rmdir --ignore-fail-on-non-empty \
    "$pkgdir/usr/share/doc/$_pkgname" "$pkgdir/usr/share/doc" 2>/dev/null || true
}
