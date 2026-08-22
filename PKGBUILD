# Maintainer: Ismet Togay <ismet.togay@gmail.com>

pkgname=threadstepper-git
pkgver=r457.8f96bb9
pkgrel=9
pkgdesc="A stability and stress tester for AMD Curve Optimizer and PBO on Linux"
arch=('any')
url="https://github.com/gazpitchy92/threadstepper"
license=('GPL-3.0-only')
depends=('python' 'python-ttkbootstrap' 'python-pillow' 'python-psutil' 'stress-ng' 'tk')
optdepends=('electron41: WebGL/browser stress tests (upstream-recommended)')
makedepends=('git')
provides=('threadstepper')
conflicts=('threadstepper') 
source=("${pkgname}::git+https://github.com/gazpitchy92/threadstepper.git"
        "threadstepper.sh"
        "threadstepper.desktop")
sha256sums=('SKIP'
            'bc6fb1439de8a01112042d5d85be3fa8c2617a4bddb0a2ca1c4ce4f8283fa97a'
            '198d8ca5320f9efb350eb721e963c7870229f5fbff3d8d7c7b19105d9c1f54d8')

prepare() {
  cd "$pkgname"
  # Upstream r457 ships an unbalanced $( in the threadstepper launcher
  # (missing closing paren of the outer command substitution), which makes
  # bash reject the whole script and breaks stress testing. Drop once fixed
  # upstream: https://github.com/gazpitchy92/threadstepper/issues/82
  sed -i '/^elapsed_formatted=\$(printf/s/$/)/' threadstepper

  # Upstream creates ttk widgets with ttkbootstrap's bootstyle= kwarg while
  # importing ttk from stdlib tkinter, which rejects the option
  # (_tkinter.TclError: unknown option "-bootstyle") -> GUI cannot start.
  # Bind ttk to ttkbootstrap in the five modules that use bootstyle.
  # Drop all three patches once fixed upstream: see also issue 82 / PR 83.
  sed -i 's/^from tkinter import scrolledtext, ttk$/from tkinter import scrolledtext\nimport ttkbootstrap as ttk/' python/ui.py python/benchmark/testing.py
  sed -i 's/^from tkinter import filedialog, scrolledtext, ttk$/from tkinter import filedialog, scrolledtext\nimport ttkbootstrap as ttk/' python/logs.py
  sed -i 's/^from tkinter import ttk$/import ttkbootstrap as ttk/' python/core_picker.py python/benchmark/ranking.py
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install wrapper script
  install -Dm755 "$srcdir/threadstepper.sh" "$pkgdir/usr/bin/threadstepper"

  # Install desktop and icon
  install -Dm644 "$srcdir/threadstepper.desktop" "$pkgdir/usr/share/applications/threadstepper.desktop"
  install -Dm644 "$srcdir/$pkgname/favicon.png" "$pkgdir/usr/share/pixmaps/threadstepper.png"

  # Copy application files
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/opt/threadstepper"
  cp -a start.py threadstepper functions python config favicon.png "$pkgdir/opt/threadstepper/"

  # Install License
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  # Ensure script is executable
  chmod +x "$pkgdir/opt/threadstepper/threadstepper"
}
