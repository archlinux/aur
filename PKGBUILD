# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=taskcat
pkgver=0.9.58
pkgrel=1
pkgdesc='Test AWS CloudFormation templates by deploying them in multiple regions'
arch=('x86_64' 'aarch64')
url='https://github.com/aws-ia/taskcat'
license=('Apache-2.0')
# ponytail: the venv is tied to this Python minor version; bump these and pkgrel when Arch moves to 3.15
depends=('python>=3.14' 'python<3.15' 'git')
optdepends=('docker: build Lambda packages for templates')
# Upstream pins dependencies older than Arch ships (urllib3<2, jsonschema 3, dulwich 0.x,
# pathspec 0.10.3, unpackaged dataclasses-jsonschema), so it gets a private virtualenv.
source=("https://files.pythonhosted.org/packages/py3/t/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
noextract=("$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('b6da1fa0e394a5cec55f119dd378666c1e0a7d5b925e5f4bbb6a154c1bbdadfe')

_venv=/usr/lib/$pkgname

build() {
    python -m venv "$srcdir/venv"
    # setuptools 81 dropped pkg_resources, which taskcat still imports.
    "$srcdir/venv/bin/pip" install --no-cache-dir --disable-pip-version-check --no-compile \
        "$srcdir/$pkgname-$pkgver-py3-none-any.whl" 'setuptools<81'
    # Python 3.14 evaluates annotations lazily, so __dict__['__annotations__'] is empty and
    # every config load fails with KeyError. inspect.get_annotations works on 3.10+.
    sed -i "s/ann = base.__dict__.get('__annotations__', {})/ann = __import__('inspect').get_annotations(base)/" \
        "$srcdir"/venv/lib/python3.*/site-packages/dataclasses_jsonschema/type_hints.py
    # pip records the build directory here.
    rm "$srcdir"/venv/lib/python3.*/site-packages/$pkgname-$pkgver.dist-info/direct_url.json
}

package() {
    install -d "$pkgdir${_venv%/*}" "$pkgdir/usr/bin"
    cp -a "$srcdir/venv" "$pkgdir$_venv"
    # Point scripts and pyvenv.cfg at the installed location instead of the build directory.
    grep -rlF "$srcdir/venv" "$pkgdir$_venv/bin" "$pkgdir$_venv/pyvenv.cfg" |
        xargs sed -i "s|$srcdir/venv|$_venv|g"
    python -m compileall -q -s "$pkgdir" -p / "$pkgdir$_venv/lib"
    ln -s "$_venv/bin/taskcat" "$pkgdir/usr/bin/taskcat"
}
