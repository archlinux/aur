# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="gourmand-git"
pkgver="1.0.0.r143.4e3fda06"
pkgrel="5"
pkgdesc="A manager, editor, and organizer for recipes."
url="https://github.com/GourmandRecipeManager/${pkgname%-git}"
license=("GPL-2.0-only")
source=("$pkgname::git+$url.git" "get-extras.py")
b2sums=("SKIP" "d31820469d0cc07c6c53f7ef2bcf59dd153c82b5fc44347bf78d32797f43dbae2ac0a158ed2aba4dc4a2a74cb54539fb5fe1e6148c81e544503da054d992fcbc")
arch=("x86_64")
makedepends=("gendesk" "coreutils" "python-virtualenv" "python-pip" "python-setuptools" "git" "intltool")
depends=("bash")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=$pkgver")

pkgver()
{
    cd "$pkgname" || exit
    local currentCommit; currentCommit="$(git rev-parse HEAD)"
    local latestReleaseWithoutPreReleases; latestReleaseWithoutPreReleases="$(git describe --tags --abbrev=0 --exclude "*rc*")"
    git describe --long --tags --match "$latestReleaseWithoutPreReleases" "$currentCommit" | sed -r "s/-([0-9]+)-/.r\1./; s/\.g/./"
}

build()
{
    gendesk -f -n --categories="Utility" --startupnotify="true"
    echo "creating start script"
    echo -e '#!/bin/bash\ncd "/opt/'"${pkgname%-git}"'/bin"\n"./'"${pkgname%-git}"'" -q "$@"' > "${pkgname%-git}"
    cd "$pkgname" || exit
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
    sed -i '1s|.*|#!/usr/bin/env -S /bin/sh -c '"'"'"\$(dirname "\$0")/python" "\$0" "\$@"'"'"'|' "venv/bin/${pkgname%-git}"
}

package()
{
    install -dv "$pkgdir/opt/${pkgname%-git}"
    cp -afv "$pkgname/venv/"* "$pkgdir/opt/${pkgname%-git}"
    install -Dvm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dvm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dvm644 "$pkgname/src/${pkgname%-git}/data/images/${pkgname%-git}.svg" "$pkgdir/usr/share/icons/${pkgname%-git}.svg"
}
