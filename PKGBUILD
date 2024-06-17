# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=packetry-git
pkgver=r573.cd3be8d
pkgrel=1
pkgdesc='USB 2.0 protocol analysis app for use with Cynthion'
arch=('x86_64')
url='https://github.com/greatscottgadgets/packetry'
license=('BSD-3-Clause')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glibc'
  'glib2'
  'gtk4'
  'hicolor-icon-theme'
  'pango'
)
makedepends=('cargo' 'git' 'inkscape' 'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('at-spi2-core' 'xorg-server-xvfb')

source=(
  "${pkgname}::git+https://github.com/greatscottgadgets/packetry.git"
  'icon.svg'  # From https://github.com/greatscottgadgets/packetry/pull/95
  'packetry.desktop'
)

sha512sums=(
  'SKIP'
  '1ab20c64195fb67204d1b0aab17e5f1d54b9d0b416074eb32fa5806a4618d0c6d3b5beb54473160690f56f969598b5d1c2de0eaaa5c87f43c14e18059d259212'
  '92b735f7cdd5c07797bd48cdffc4cef2218df1a0d0517a8acb6813e41a972a0881eadf617dfe7524f4ed48e5e14fd55743a986f50a707bfca0f279068f46e410'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"

  echo >&2 'Applying Sphinx compatibility fix'
  # See also:
  # https://github.com/sphinx-doc/sphinx/issues/10474#issuecomment-1140389657
  sed -i -e 's/^\(language =\).*/\1 "en"/' docs/source/conf.py

  echo >&2 'Downloading dependencies'
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  echo >&2 'Building executable'
  cargo build --frozen --release --features step-decoder

  echo >&2 'Generating documentation'
  make -C docs man singlehtml

  echo >&2 'Generating application icons'
  for resolution in 16 22 32 48 64 256; do
    mkdir -p \
      "assets/icon-generated/${resolution}x${resolution}" \
      "assets/icon-generated/${resolution}x${resolution}@2"
    inkscape -w "${resolution}" --export-background-opacity=0 \
      --export-filename="assets/icon-generated/${resolution}x${resolution}/icon.png" \
      ../icon.svg
    inkscape -w "$((resolution * 2))" --export-background-opacity=0 \
      --export-filename="assets/icon-generated/${resolution}x${resolution}@2/icon.png" \
      ../icon.svg
  done
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  dbus-run-session xvfb-run -s '-nolisten local' \
    cargo test --frozen
}

package() {
  cd "${pkgname}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin/" \
    "target/release/${pkgname%-git}"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_static}
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    docs/build/man/*.1

  echo >&2 'Packaging the icons'
  for resolution in 16 22 32 48 64 256; do
    install -D -m 644 -T \
      "assets/icon-generated/${resolution}x${resolution}/icon.png" \
      "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}/apps/packetry.png"
    install -D -m 644 -T \
      "assets/icon-generated/${resolution}x${resolution}@2/icon.png" \
      "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}@2/apps/packetry.png"
  done

  echo >&2 'Packaging the desktop entry'
  install -D -m 644 -t "${pkgdir}/usr/share/applications" \
    ../packetry.desktop

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
