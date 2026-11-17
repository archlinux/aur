# Maintainer: Agent Labs <https://github.com/agent-labs-dev/fastbrowse/issues>
#
# Written from the PyPI release by scripts/aur_package.py, which sets pkgver and sha256sums.

pkgname=fastbrowse
pkgver=0.11.1
pkgrel=1
pkgdesc="Browser automation with cited answers, structured output and code-controlled credentials and authorization"
# The wheel carries the Rust core as `fastbrowse._native`, compiled here from the sdist, so the package is one per
# architecture (docs/adr/0004).
arch=('x86_64' 'aarch64')
# makepkg's LTO flags compile ring's C and assembly into bitcode the Rust link does not pull in, which leaves the
# module with undefined ring symbols at import.
options=('!lto')
url="https://github.com/agent-labs-dev/fastbrowse"
license=('MIT')
depends=(
  'python>=3.13'
  'python-h2'
  'python-httpx>=0.28.1'
  'python-pydantic>=2.11'
)
makedepends=('python-build' 'python-installer' 'python-maturin' 'rust')
optdepends=(
  'chromium: a local browser for --local'
  'google-chrome: a local browser for --local'
)
source=("https://files.pythonhosted.org/packages/source/f/fastbrowse/fastbrowse-$pkgver.tar.gz")
sha256sums=('1743ffed7a6b13b6a79b902c99604bf6e6a24f882394e67242ed21dab6568472')

build() {
  cd "$srcdir/fastbrowse-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  local prefix=/opt/fastbrowse script
  # A virtual environment is this file and an interpreter beside it. Written by hand, because `python -m venv`
  # records the build directory in the files it makes.
  install -d "$pkgdir$prefix/bin" "$pkgdir/usr/bin"
  ln -s /usr/bin/python "$pkgdir$prefix/bin/python"
  printf 'home = /usr/bin\ninclude-system-site-packages = true\n' > "$pkgdir$prefix/pyvenv.cfg"
  python -m installer --destdir="$pkgdir" --prefix="$prefix" "$srcdir/fastbrowse-$pkgver"/dist/*.whl

  for script in fastbrowse fastbrowse-mcp; do
    # The installer names the interpreter that ran it, which would start the system Python and never look in
    # the private prefix.
    sed -i "1s|.*|#!$prefix/bin/python|" "$pkgdir$prefix/bin/$script"
    ln -s "$prefix/bin/$script" "$pkgdir/usr/bin/$script"
  done

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/fastbrowse-$pkgver"/{LICENSE,NOTICE}
}
