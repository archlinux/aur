pkgname=mkunified-git
pkgver=0.r5.g1a5763a
pkgrel=2
pkgdesc="Unified kernel image generation utility which supports initrd generation using mkinitcpio"
arch=(any)
url='https://github.com/ErnyTech/mkunified'
license=('AGPL-3.0')
depends=('bash' 'util-linux' 'grep' 'sed' 'imagemagick' 'mkinitcpio' 'sbsigntools')
makedepends=('git')
backup=(etc/mkunified.conf)
source=('git://github.com/ErnyTech/mkunified.git')
sha256sums=('SKIP')

pkgver() {
    cd mkunified/

    if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
        printf '%s.r%s.g%s' \
            "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
            "$(git rev-list --count ${GITTAG}..)" \
            "$(git log -1 --format='%h')"
    else
        printf '0.r%s.g%s' \
            "$(git rev-list --count master)" \
            "$(git log -1 --format='%h')"
    fi
}

package() {
    cd mkunified/
    install -m755 -D mkunified ${pkgdir}/usr/bin/mkunified
    
    install -m644 -D mkunified.conf ${pkgdir}/etc/mkunified.conf
    install -m644 -D mkunified.d/hook.preset ${pkgdir}/usr/share/mkunified/hook.preset
    
    install -m644 -D libalpm/hooks/90-mkunified-install.hook ${pkgdir}/usr/share/libalpm/hooks/90-mkunified-install.hook
    install -m755 -D libalpm/scripts/mkunified-install ${pkgdir}/usr/share/libalpm/scripts/mkunified-install
    install -m644 -D libalpm/hooks/60-mkunified-remove.hook ${pkgdir}/usr/share/libalpm/hooks/60-mkunified-remove.hook
    install -m755 -D libalpm/scripts/mkunified-remove ${pkgdir}/usr/share/libalpm/scripts/mkunified-remove
}



