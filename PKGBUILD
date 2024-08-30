# Maintainer: z3n <z3nlabs at proton dot me>
pkgname=mixbus10
pkgver=10.1.0
pkgrel=1
pkgbase=mixbus10
pkgdesc="Harrison Consoles Mixbus DAW (Version 10)"
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/mixbus"
license=('EULA')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs')
optdepends=('avldrums.lv2: AVLinux drumkits'
            'gmsynth.lv2: General MIDI LV2 Synth'
            'setbfree-lv2: Tonewheel organ'
            'x42-plugins-lv2: Set of plugins and utilities from the X42 Project')
source=("https://s3.eu-west-1.amazonaws.com/eu1.download.solidstatelogic.com/Harrison/Mixbus-${pkgver}-x86_64.tar")
sha256sums=('69023fdc10e153b721b62bd82729365dbf331e123d56af6481fd6f7ea21f220c')
options=('!strip')

## Variables
_tarfile="Mixbus-${pkgver}-x86_64.tar"
_installer="Mixbus-${pkgver}-x86_64.run"
_app="Mixbus_x86_64-$pkgver"

package() {
    echo "Starting package() function..."

    ## Create Install Directories
    echo "Creating install directories..."
    mkdir -p "$pkgdir/opt/$pkgname" "$pkgdir/usr/share/applications"

    ## Extract .tar archive to get the .run file
    echo "Extracting tar file..."
    tar -xf "$srcdir/$_tarfile" -C "$srcdir"

    ## Extract Installer
    echo "Extracting installer..."
    sh "$srcdir/$_installer" --tar xf

    ## Extract Bundle
    echo "Extracting bundle..."
    tar -xvf "$srcdir/$_app.tar" -C "$srcdir"

    ## Remove LV2 Plugins Provided in Archlinux Repos
    echo "Removing unnecessary LV2 plugins..."
    rm -r "$srcdir/$_app/lib/LV2/avldrums.lv2"
    rm -r "$srcdir/$_app/lib/LV2/b_synth.lv2"
    rm -r "$srcdir/$_app/lib/LV2/b_whirl.lv2"
    rm -r "$srcdir/$_app/lib/LV2/dpl.lv2"
    rm -r "$srcdir/$_app/lib/LV2/fat1.lv2"
    rm -r "$srcdir/$_app/lib/LV2/fil4.lv2"
    rm -r "$srcdir/$_app/lib/LV2/gmsynth.lv2"
    rm -r "$srcdir/$_app/lib/LV2/meters.lv2"
    rm -r "$srcdir/$_app/lib/LV2/midifilter.lv2"
    rm -r "$srcdir/$_app/lib/LV2/stereoroute.lv2"
    rm -r "$srcdir/$_app/lib/LV2/tuna.lv2"

    ## Remove Uninstall Script
    echo "Removing uninstall script..."
    rm -r "$srcdir/$_app/bin/Mixbus-${pkgver}.uninstall.sh"

    ## Install Mixbus
    echo "Copying application files to $pkgdir/opt/$pkgname..."
    cp -r "$srcdir/$_app"/* "$pkgdir/opt/$pkgname"

    ## Install Desktop File
    echo "Creating desktop file..."
    echo "[Desktop Entry]" > "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Encoding=UTF-8" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Version=1.0" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Type=Application" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Terminal=false" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Exec=/opt/$pkgname/bin/mixbus10" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Name=Harrison Mixbus Version 10" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Icon=/opt/$pkgname/share/resources/Mixbus-icon_256px.png" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Comment=Digital Audio Workstation" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
    echo "Categories=AudioVideo;AudioEditing;Audio;Recorder;" >> "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"

    ## Change permissions of desktop file
    echo "Setting permissions for desktop file..."
    chmod 644 "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop"
}
