set lazy

pkgname := `grep "pkgname=" PKGBUILD | cut -d'=' -f2`

@_default:
    just --list

cleanup:
    rm {{ pkgname }}-*.tar.gz

release VERSION:
    sed -i -e "s/pkgver=.*/pkgver={{ VERSION }}/g" -e "s/pkgrel=.*/pkgrel=1/g"  PKGBUILD
    updpkgsums
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD .SRCINFO
    git ci -m "{{ pkgname }} v{{ VERSION }}"
