# Maintainer: dibof228

pkgname=max
pkgver=25.8.0.454
pkgrel=1

pkgdesc="MAX is a multifunctional digital platform with a fully integrated messenger. Animated stickers, personal and group correspondence, status, voices, messages, the ability to send files up to 4 GB - here is everything you need to share your mood and important information."
arch=("x86_64")
url='https://max.ru'
license=("unknown")
categories=("network")

depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret" "tar" "binutils")

source=("https://download.max.ru/electron/MAX.deb")
noextract=("MAX.deb")
md5sums=('SKIP')

prepare() {
    ar x "MAX.deb"
    tar -xf data.tar.xz
}

package() {
    cp -r "${srcdir}/usr" "${pkgdir}/"
    cp -r "${srcdir}/opt" "${pkgdir}/"
}

post_install() {
    if type update-alternatives 2>/dev/null >&1; then
        if [ -L '/usr/bin/MAX' -a -e '/usr/bin/MAX' -a "`readlink '/usr/bin/MAX'`" != '/etc/alternatives/MAX' ]; then
            rm -f '/usr/bin/MAX'
        fi
        update-alternatives --install '/usr/bin/MAX' 'MAX' '/opt/MAX/MAX' 100 || ln -sf '/opt/MAX/MAX' '/usr/bin/MAX'
    else
        ln -sf '/opt/MAX/MAX' '/usr/bin/MAX'
    fi

    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 '/opt/MAX/chrome-sandbox' || true
    else
        chmod 0755 '/opt/MAX/chrome-sandbox' || true
    fi

    if hash update-mime-database 2>/dev/null; then
        update-mime-database /usr/share/mime || true
    fi

    if hash update-desktop-database 2>/dev/null; then
        update-desktop-database /usr/share/applications || true
    fi

    if apparmor_status --enabled > /dev/null 2>&1; then
    APPARMOR_PROFILE_SOURCE='/opt/MAX/resources/apparmor-profile'
    APPARMOR_PROFILE_TARGET='/etc/apparmor.d/MAX'
    if apparmor_parser --skip-kernel-load --debug "$APPARMOR_PROFILE_SOURCE" > /dev/null 2>&1; then
        cp -f "$APPARMOR_PROFILE_SOURCE" "$APPARMOR_PROFILE_TARGET"

        if ! { [ -x '/usr/bin/ischroot' ] && /usr/bin/ischroot; } && hash apparmor_parser 2>/dev/null; then
        apparmor_parser --replace --write-cache --skip-read-cache "$APPARMOR_PROFILE_TARGET"
        fi
    else
        echo "Skipping the installation of the AppArmor profile as this version of AppArmor does not seem to support the bundled profile"
    fi
    fi
}

post_remove() {
    if type update-alternatives >/dev/null 2>&1; then
        update-alternatives --remove 'MAX' '/usr/bin/MAX'
    else
        rm -f '/usr/bin/MAX'
    fi

    APPARMOR_PROFILE_DEST='/etc/apparmor.d/MAX'

    if [ -f "$APPARMOR_PROFILE_DEST" ]; then
    rm -f "$APPARMOR_PROFILE_DEST"
    fi
}
