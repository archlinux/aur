# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig,de>

# Script to download BBB recordings.

pkgname="bbb-recorder-git"
pkgver=0.0.0+81
pkgrel=3
pkgdesc="Tool to download recordings from Big Blue Button"
arch=("any")
url="git+https://github.com/jibon57/bbb-recorder"
license=("MIT")
# 1:1 list of the debian packages in ./dependencies_check.sh.
# But it looks more like the dependencies of chromium.
depends=( # 'alsa-lib'
          # 'atk'
          # 'glibc'
          # 'cairo'
          # 'libcups'
          # 'dbus'
          # 'expat'
          # 'fontconfig'
          # 'gcc-libs'
          # 'gconf'
          # 'gdk-pixbuf2'
          # 'glib2'
          # 'gtk3'
          # 'nspr'
          # 'pango'
          # 'gcc'
          #'libx11'
          #'libxcb'
          #'libxcomposite'
          #'libxcursor'
          #'libxdamage'
          #'libxext'
          #'libxfixes'
          #'libxi'
          #'libxrandr'
          #'libxrender'
          #'libxss'
          #'libxtst'
          # 'ca-certificates'
          # 'libappindicator-gtk3'
          # 'ttf-liberation'
          # 'nss'
          # 'lsb-release'
          # 'xdg-utils'
          # 'wget'
          'xorg-server-xvfb'
          # 'fonts-noto'
          )
# Dependencies mentioned elsewhere:
depends+=('nodejs')
# Because it uses a hardcoded path (can be changed, see prepare function):
depends+=('chromium')
optdepends+=('ffmpeg: converting webm to mp4')
makedepends=('git' 'npm')
install=bbb-recorder.install
source=("git+https://github.com/jibon57/bbb-recorder.git"
        "BigBlueButton-2.3.patch::https://github.com/hooktstudios/bbb-recorder/commit/62c989d304a04fdf7aed565e729ac12f6d14848e.patch")
sha256sums=('SKIP'
            'f30a3949ffc46b7a02014352b0ec41c0ef08eecf6cc9e5ac53ca3639f0daeb5d')

pkgver() {
    cd "$srcdir"/bbb-recorder
    # Currently no tags exist, using commit count.
    echo -n 0.0.0+ && git rev-list HEAD --count
}

prepare() {
    cd "$srcdir"/bbb-recorder

    echo ""
    echo ""
    echo "THIS PATCH SUPPORTS BBB 2.3, BUT NOT ANYMORE BBB 2.0!"
    echo "if needed, build again without the patch."
    echo "Also, might fail some day after development of this software continued."
    #     (worked with commit f2520ca)
    echo ""
    echo ""

    patch -p1 < "$srcdir"/BigBlueButton-2.3.patch

    cd "$srcdir"


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
grep -s copyToPath /opt/bbb-recorder/.env | grep --quiet ~/Downloads$ && echo "The copyToPath cannot be you Downloads directory, because the video is temporarily stored there and later deleted!" && help=1
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
    # Script would also work from any other directory as long as it has an ./.env file in it.
    cd /opt/bbb-recorder

    exec node export.js "\$@"
fi
EOF

    sed -e "s/export.js/liveJoin.js/" \
        -e "s/recording link/join link/" \
        -e "s/real duration of recording/until the end of the meeting/" \
        bbb-recorder-export.sh > bbb-recorder-livejoin.sh

    cd "$srcdir"/bbb-recorder
    # Google Chrome has a different filename than on Debain, need to change it to something else!
    # Using chromium.
    sed -i '/options.executablePath/ s!/usr/bin/google-chrome!/usr/bin/chromium!' \
      export.js liveJoin.js liveRTMP.js
}

build() {
    cd "$srcdir"/bbb-recorder
    npm install --ignore-scripts --silent --no-package-lock --no-update-notifier
    npm install --ignore-scripts --silent --no-package-lock --no-update-notifier examples
    find -name package.json -exec sed -i '/_where/d' {} +
}

package() {
    install -Dm755 bbb-recorder-export.sh    "$pkgdir"/usr/bin/bbb-recorder

    # AFAICT the other scripts are only usable if you adminstrate the BBB server too.
    # install -Dm755 bbb-recorder-livejoin.sh  "$pkgdir"/usr/bin/bbb-recorder-livejoin
    # install -Dm755 bbb-recorder-broadcast.sh "$pkgdir"/usr/bin/bbb-recorder-broadcast

    # Storing it together with the node modules in /opt, so that the node modules do not need to be installed globally.
    install -Dm644 "$srcdir"/bbb-recorder/.env.example -t "$pkgdir"/opt/bbb-recorder/
    cp -a "$srcdir"/bbb-recorder/* "$pkgdir"/opt/bbb-recorder/

    # Did that already by listing them as package dependencies.
    rm "$pkgdir"/opt/bbb-recorder/dependencies_check.sh

    # Need to do that differently (like in the bbb-recorder.install script).
    # It even seems that the namespaceing for users is not needed.
    rm "$pkgdir"/opt/bbb-recorder/namespace_checker.sh

    # Example script for usage with docker-compose, should not be used without it.
    chmod 644 "$pkgdir"/opt/bbb-recorder/start_stream.sh
    mv "$pkgdir"/opt/bbb-recorder/start_stream.sh "$pkgdir"/opt/bbb-recorder/docker-compose.start_stream.sh

    install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
    mv "$pkgdir"/opt/bbb-recorder/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
