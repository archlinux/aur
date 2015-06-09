# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=exenv-git
pkgver=20140615
pkgrel=1
pkgdesc="Elixir version management tool"
arch=('any')
makedepends=('git')
optdepends=('elixir-build: compile and install different versions of Elixir')
url="https://github.com/mururu/exenv"
license=('MIT')
source=(git+https://github.com/mururu/exenv)
sha256sums=('SKIP')
provides=('exenv')
conflicts=('exenv')
install=exenv.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing autocompletion...'
  install -Dm 644 completions/exenv.bash "$pkgdir/usr/share/bash-completion/completions/exenv"
  install -Dm 644 completions/exenv.zsh  "$pkgdir/usr/share/zsh/site-functions/_exenv"

  msg 'Installing executables...'
  install -Dm 755 "bin/elixir-local-exec" "$pkgdir/usr/bin/elixir-local-exec"
  for _bin in `find libexec -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 libexec/$_bin "$pkgdir/usr/bin/$_bin"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
