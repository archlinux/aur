# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="gourmand-git"
pkgver="1.0.0.r143.4e3fda06"
pkgrel="1"
pkgdesc="A manager, editor, and organizer for recipes."
url="https://github.com/GourmandRecipeManager/${pkgname%-git}"
license=("GPL-2.0-only")
source=("$pkgname::git+$url.git")
b2sums=("SKIP")
arch=("x86_64")
makedepends=("gendesk" "coreutils" "python-virtualenv" "python-pip" "python-setuptools" "git")
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
    gendesk -f -n --categories="Utility" --startupnotify="true" --exec="gourmand -q"
    echo "creating start script"
    echo -e '#!/bin/bash\ncd "/opt/'"${pkgname%-git}"'/bin"\n"./'"${pkgname%-git}"'" "$@"' > "start.sh"
    ln -fsv "/opt/${pkgname%-git}/start.sh" "${pkgname%-git}"
    cd "$pkgname" || exit
    echo "creating virtual environment"
    python -m venv --clear --copies venv
    echo "building Gourmand wheel"
    python setup.py bdist_wheel
    echo "installing into virtual environment"
    local wheel; wheel="$(ls dist/*.whl)"
    venv/bin/pip install "$wheel[epub-export,pdf-export,spellcheck]" "setuptools"
    echo "removing unnecessary packages from virtual environment"
    venv/bin/pip uninstall -y pip
    echo "making virtual environment portable"
    sed -i '1s|.*|#!/usr/bin/env -S /bin/sh -c '"'"'"\$(dirname "\$0")/python" "\$0" "\$@"'"'"'|' venv/bin/gourmand
}

package()
{
    install -dv "$pkgdir"/{"opt/${pkgname%-git}","usr/bin"}
    cp -afv "${pkgname%-git}" "$pkgdir/usr/bin"
    cp -afv "$pkgname/venv/"* "$pkgdir/opt/${pkgname%-git}"
    install -Dvm755 "start.sh" "$pkgdir/opt/${pkgname%-git}/start.sh"
    install -Dvm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dvm644 "${pkgname%}/src/${pkgname%-git}/data/images/${pkgname%-git}.svg" "$pkgdir/usr/share/icons/${pkgname%-git}.svg"
}
