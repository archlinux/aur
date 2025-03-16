# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
# Contributor: Yigit Sever <echo eWlnaXRAeWlnaXRzZXZlci5jb20K | base64 -d>
pkgname="gourmand"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="A manager, editor, and organizer for recipes."
url="https://github.com/GourmandRecipeManager/$pkgname"
license=("GPL-2.0-only")
source=("$pkgname-git::git+$url.git#commit=$pkgver" "get-extras.py")
b2sums=("SKIP" "d31820469d0cc07c6c53f7ef2bcf59dd153c82b5fc44347bf78d32797f43dbae2ac0a158ed2aba4dc4a2a74cb54539fb5fe1e6148c81e544503da054d992fcbc")
arch=("x86_64")
makedepends=("gendesk" "coreutils" "python-virtualenv" "python-pip" "python-setuptools" "git" "intltool")
depends=("bash")
conflicts=("$pkgname")
provides=("$pkgname=$pkgver")

pkgver()
{
    cd "$pkgname-git" || exit
    git describe --tags --abbrev=0 --exclude "*rc*"
}

build()
{
    gendesk -f -n --categories="Utility" --startupnotify="true"
    echo "creating start script"
    echo -e '#!/bin/bash\ncd "/opt/'"$pkgname"'/bin"\n"./'"$pkgname"'" -q "$@"' > "$pkgname"
    cd "$pkgname-git" || exit
    echo "creating virtual environment"
    python -m venv --clear --copies venv
    echo "building Gourmand wheel"
    python setup.py bdist_wheel
    echo "installing into virtual environment"
    local wheel; wheel="$(ls dist/*.whl)"
    local extras; extras="$($srcdir/get-extras.py)"
    venv/bin/pip install --isolated "$wheel[$extras]" "setuptools"
    echo "removing unnecessary packages from virtual environment"
    venv/bin/pip uninstall --isolated -y pip
    echo "making virtual environment portable"
    sed -i '1s|.*|#!/usr/bin/env -S /bin/sh -c '"'"'"\$(dirname "\$0")/python" "\$0" "\$@"'"'"'|' "venv/bin/$pkgname"
}

package()
{
    install -dv "$pkgdir/opt/$pkgname"
    cp -afv "$pkgname-git/venv/"* "$pkgdir/opt/$pkgname"
    install -Dvm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dvm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 "$pkgname-git/src/$pkgname/data/images/$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
}
