# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig,de>

# CLI script to download BBB recordings … and some other things.

pkgname="bbb-recorder-git"
pkgver=0.0.0+81
pkgrel=1
pkgdesc="Tool to download recordings from Big Blue Button"
arch=("any")
url="git+https://github.com/jibon57/bbb-recorder"
license=("MIT")
# 1:1 list of the debian packages in ./dependencies_check.sh.
depends=('alsa-lib'
         'atk'
         'glibc'
         'cairo'
         'libcups'
         'dbus'
         'expat'
         'fontconfig'
         'gcc-libs'
         'gconf'
         'gdk-pixbuf2'
         'glib2'
         'gtk3'
         'nspr'
         'pango'
         'gcc'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxi'
         'libxrandr'
         'libxrender'
         'libxss'
         'libxtst'
         'ca-certificates'
         'nss'
         'xdg-utils'
         'wget'
         'xorg-server-xvfb')
# Also part of the list, I SUPPOSE they MAY be optional.
optdepends=('ttf-liberation: possibly required'
            'libappindicator-gtk3: possibly required'
            'lsb-release: possibly required'
            'fonts-noto: possibly required')
# Dependencies mentioned elsewhere:
depends+=('nodejs')
optdepends+=('ffmpeg: converting webm to mp4')
makedepends=('git' 'npm')
# Because it uses a hardcoded path (can be changed, see prepare function):
depends+=('chromium')
install=bbb-recorder.install
source=(git+https://github.com/jibon57/bbb-recorder.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/bbb-recorder
    # Currently no tags exist, using commit count.
    echo -n 0.0.0+ && git rev-list HEAD --count
}

prepare() {
    # Avoiding to install the node modules globally.
    # Using wrappers, to call the scripts from anywhere.
    # Let the wrappers have the same arguments like the js files,
    # and use therefore three wrappers instead of one.

    cat << EOF > bbb-recorder-export.sh
#!/bin/bash

# Script can be executed or sourced.

[[ \$# -lt 1 || \$# -gt 4 ]] && help=1
[ ! -d ~/Downloads ] && echo "Directory ~/Downloads not found!" && help=1
[ ! -f /opt/bbb-recorder/.env ] && echo "Configuration file /opt/bbb-recorder/.env was not created. See /opt/bbb-recorder/.env.example" && help=1
if grep -s copyToPath /opt/bbb-recorder/.env | grep --quiet ~/Downloads$; then echo "The copyToPath cannot be you Downloads directory, because the video is temporarily stored there and later deleted!" && help=1; fi
[[ \$2 == */* ]] &&  echo "The filename cannot be a path!" && help=1
[[ \${2%.webm} == *.* ]] && echo "No dots are allowed as part of the filname except for the file extension .webm!" && help=1

if [[ \$help -eq 1 ]]; then
    unset help
    echo ''
    echo 'Valid arguments are:'
    echo '\$1: BBB recording link (mandatory).'
    echo '\$2: Export file name (should be .webm at the end) or the special value MEETING_ID (default). Cannot be a path.'
    echo '\$3: Duration of recording in seconds. 0 = real duration of recording (default).'
    echo '\$4: Enter "true" to convert to mp4.'
else
    # Script would also work from any other directory as long as it has an ~/.env file in it.
    cd /opt/bbb-recorder

    exec node export.js "\$@"
fi
EOF
    sed s/export.js/liveJoin.js/ bbb-recorder-export.sh > bbb-recorder-livejoin.sh

    cd "$srcdir"/bbb-recorder
    # Google Chrome has a different filename than on Debain, need to change it to something else!
    # Using chromium.
    sed -i '/options.executablePath/ s!/usr/bin/google-chrome!/usr/bin/chromium!' \
      export.js liveJoin.js liveRTMP.js
}

build() {
    cd "$srcdir"/bbb-recorder
    npm install --ignore-scripts --no-progress --silent --no-fund --no-package-lock
    npm install --ignore-scripts --no-progress --silent --no-fund --no-package-lock examples 
    find -name package.json -exec sed -i '/_where/d' {} +
}

package() {
    install -Dm755 bbb-recorder-export.sh    "$pkgdir"/usr/bin/bbb-recorder
    # AFAICT the other scripts are only usable if you adminstrate the BBB server too.
    # install -Dm755 bbb-recorder-livejoin.sh  "$pkgdir"/usr/bin/bbb-recorder-livejoin
    # install -Dm755 bbb-recorder-broadcast.sh "$pkgdir"/usr/bin/bbb-recorder-broadcast

    # Storing it together with the node modules in /opt.
    install -Dm644 "$srcdir"/bbb-recorder/.env.example -t "$pkgdir"/opt/bbb-recorder/
    cp -a "$srcdir"/bbb-recorder/* "$pkgdir"/opt/bbb-recorder/

    # Did that already by listing them as package dependencies.
    rm "$pkgdir"/opt/bbb-recorder/dependencies_check.sh

    # Need to do that differently (like in the bbb-recorder-git.install script).
    # It even seems that the namespaceing for users is not needed.
    rm "$pkgdir"/opt/bbb-recorder/namespace_checker.sh
}
