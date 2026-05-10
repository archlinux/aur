@_default:
    just --list

cleanup:
    rm pacman-mirrorup-*.tar.gz

release VERSION:
    sed -i -e "s/pkgver=.*/pkgver={{ VERSION }}/g" -e "s/pkgrel=.*/pkgrel=1/g"  PKGBUILD
    updpkgsums
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD .SRCINFO
    git ci -m "pacman-mirrorup v{{ VERSION }}"
