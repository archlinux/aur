# Maintainer: Det <nimetonmaili g-mail>

pkgname=lastpass
pkgver=3.1.95
_universal=$pkgver   # Version of the universal installer: https://lastpass.com/misc_download2.php
_chromver=3.2.11-1   # The actual extensions' versions
_ffver=3.1.95-2
pkgrel=1
pkgdesc="The Universal LastPass installer for Firefox, Chrome, and Opera"
arch=('i686' 'x86_64')
url="https://lastpass.com"
license=('custom')
depends=('libxcb')
optdepends=('chromium: for Chromium'
            'chromium-dev: for Chromium (Dev Channel) (AUR)'
            'firefox: for Mozilla Firefox'
            'firefox-beta-bin: for Mozilla Firefox (Beta) (AUR)'
            'firefox-nightly: for Mozilla Firefox (Nightly) (AUR)'
            'google-chrome: for Google Chrome (AUR)'
            'google-chrome-beta: for Google Chrome (Beta Channel) (AUR)'
            'google-chrome-dev: for Google Chrome (Dev Channel) (AUR)'
            'opera: for Opera'
            'opera-beta: for Opera Beta (AUR)'
            'opera-developer: for Opera Developer (AUR)')
install=$pkgname.install
source=(# Chrome
        "lpchrome_linux_$_chromver.crx::$url/lpchrome_linux.crx"
        "lplinux_$_universal.tar.bz2::$url/lplinux.tar.bz2"
        'com.lastpass.nplastpass.json'
        'lastpass_policy.json'
        # Firefox
        "lp_linux_$_ffver.xpi::$url/lp_linux.xpi"
        'profiles.ini')
noextract=("lp_linux_$_ffver.xpi")
md5sums=('c1555f5a573ffaf18d769beee1ccf730'
         '560746ff6a325200de014a0a599a69bb'
         '151251e415bccdffc1dc0df592d1d7e1'
         '9af777d2eea8e67ad332235718a7653d'
         'c3a18d917ce157ee0d0932c2acccaf7d'
         'd0f555a644484baccf649f7969794ece')

# 64-bit?
if [[ $CARCH = x86_64 ]]; then
    _64=64
fi

prepare() {
    # Write user var to .install
    sed -i "s/_user=[^ ]*/_user=$USER/" "$startdir"/$pkgname.install
}

_chrome_package() {
    # Install to single place for linking
    install -Dm644 lpchrome_linux_$_chromver.crx "$pkgdir"/usr/share/lastpass/lpchrome_linux_$_chromver.crx
    install -Dm755 nplastpass$_64 "$pkgdir"/etc/opt/chrome/native-messaging-hosts/nplastpass$_64

    # 64-bit?
    sed "s|/nplastpass|/nplastpass$_64|" \
        -i com.lastpass.nplastpass.json

    # JSONs
    for i in opt/chrome chromium chromium-dev; do
        # Messaging host
        install -Dm644 com.lastpass.nplastpass.json "$pkgdir"/etc/$i/native-messaging-hosts/com.lastpass.nplastpass.json

        # Allow silent installation since Chrome v21: http://www.chromium.org/administrators/policy-list-3#ExtensionInstallSources
        install -Dm644 lastpass_policy.json "$pkgdir"/etc/$i/policies/managed/lastpass_policy.json
    done
}

_firefox_package() {
    # Extension + profiles.ini go to $HOME, so do this in .install
    for i in lp_linux_$_ffver.xpi profiles.ini; do
        install -Dm644 $i "$pkgdir"/usr/share/lastpass/$i
    done

    # Binary plugin
    install -Dm755 libnplastpass$_64.so "$pkgdir"/usr/lib/mozilla/plugins/libnplastpass$_64.so
}

package() {
    msg2 "Installing for Google Chromes/Chromiums..."
    _chrome_package

    msg2 "Installing for Mozilla Firefoxes..."
    _firefox_package
}
