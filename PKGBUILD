# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=python-pypdfform
_name=PyPDFForm
pkgver=5.3.0
pkgrel=1
pkgdesc="create, inspect, style, fill PDF forms in Python or from the command line"
arch=('any')
url="https://github.com/chinapandaman/PyPDFForm"
license=('MIT')
depends=('python-pikepdf')
makedepends=(
  python-{build,installer,setuptools,typer,jsonschema,yaml}
  bash zsh)
checkdepends=(python-{pytest,coverage})
optdepends=("python-"{typer,jsonschema,yaml}": for CLI usage")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0c66bfd573713881ad192c78c14e1fbc9dcee9c2e1920210a4026399155eaf26ac7a0075bfd01ad6374dc86750531b56b576c3502a508db94dce79756a07291f')

pkgver() {
  curl -s "${url/github.com/api.github.com/repos}/releases/latest" \
    | jq -r '.tag_name[1:]'
}

build() {
	cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
  coverage run -m pytest
  coverage report --fail-under=100
}

package() {
	cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d \
    "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
  local run="from $_name.cli.entry import main; main()"
  _PYPDFFORM_COMPLETE=source_bash python -P "$pkgdir/usr/bin/${_name,,}" \
    --show-completion > "$pkgdir/usr/share/bash-completion/completions/$_name"
  _PYPDFFORM_COMPLETE=source_zsh python -P "$pkgdir/usr/bin/${_name,,}" \
    --show-completion > "$pkgdir/usr/share/zsh/site-functions/_${_name,,}"
}

