# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird: https://git.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/thunderbird

pkgname=thunderbird-beta
pkgver=60.0b1
_major=${pkgver/[br]*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone mail and news reader from mozilla.org - Bleeding edge version"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/thunderbird/"
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         nss sqlite ttf-font icu libvpx)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils xorg-server-xvfb
             autoconf2.13 cargo clang llvm)
optdepends=('hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libcanberra: Sound support')
options=(!emptydirs !makeflags)
install=$pkgname.install
source=(https://ftp.mozilla.org/pub/thunderbird/releases/59.0b2/source/thunderbird-59.0b2.source.tar.xz
        https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/$pkgname.desktop
        https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/thunderbird-install-dir.patch
       https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/no-crmf.diff
        https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/fix-wifi-scanner.diff
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/firefox-52-disable-data-sharing-infobar.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/firefox-52-disable-location.services.mozilla.com.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/firefox-52-disable-telemetry.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/fix2.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/fix.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/p.patch
)

sha512sums=('620408f69087d3d36f60865389f0d9796f6e5b558ba4de84e97f6c84675eb32f1bea1e2be93c86dd77bfb5333baf6d6aaf5b1ca9027132cc40df8c983a42d9d8'
            'e5649ddee3ca9cfdcf56652e9c8e6160d52c69d1439f9135b0c0d436ce61a25f17758afc0dd6cac3434c26234c584828eb07fdf9604797f7dd3f617ec194b79a'
            '33f5c73b18b078c49b97ebd526a8d07eb091deb223018068434cec0ff95e4ac64dbde70f1c2ccf46f833a17f898bb9a916357eebac05f39399f23a08f79149f7'
            '951667941520e66e7b6aad55619ec2b38364da58c5cf8a71775a3032921cfc0a8e5c7ba14e0df35588175f94a6b4785566d39177ff536ab9cefcbd19a03dc065'
            '1bd2804bea1fe8c85b602f8c5f8777f4ba470c9e767ad284cb3d0287c6d6e1b126e760738d7c671f38933ee3ec6b8931186df8e978995b5109797ae86dfdd85a'
            '38d8e4d96fb2324b27bc9518ef54db3c47a6fc6846342e58ced56898bbafc09562e8c483998bab573908b5019ed88611c4893f752de491236cda00945d1d156a'
            '45efc5fdbfd63d53763c1cfdb01647a38efedc8f8af8dacef95c73b06fb5e9030d1597d16bc8337f8fa52b9b6d060c8cb85387dd81e5157340746c17a81225e6'
            'ba950af03a906918d0981e18c0c6e131d0ef2bfb890bedbc47215e82b354a34ade89de1655bd245e76301a08cd543a4522745da47d70939bfe8adeab51e60501'
            '71ccc1ab8c28c269d2dd52f474dcc59bdb48defc3f38efc2e0725c1581ab14497753a790dd17325b74545d22f99b7cbaa46d461cc8fe73898632bb69b4238b4f'
            'e43c3d5862f752dfbb7df2774bf57f675ee088985055a2d7fa67a5e6de864db4b5a25034854e9bd82b060fbff7668887f88b34e15cf61eb4de54fc6b0b60076f'
            '192b99ca24bce0c516d85fdd5da4ded66bcfe64b4b86024d61052b5e18caf99b3c04b0f9196483e59b752cc5ac1bc14310d575a92b7243aaeac2eee02ce6acfb')


# RC
if [[ $_build = ? ]]; then
  source[0]="https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/source/thunderbird-$_major.source.tar.xz"
fi


prepare() {
  # Link Python2
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd thunderbird-$pkgver

  msg2 "thunderbird-install-dir.patch"
  patch -Np1 -i ../thunderbird-install-dir.patch

  msg2 "no-crmf.diff: https://bugzilla.mozilla.org/show_bug.cgi?id=1371991"
  patch -Np1 -i ../no-crmf.diff



cd mozilla

patch -Np1 -i ../../firefox-52-disable-data-sharing-infobar.patch
patch -Np1 -i ../../firefox-52-disable-location.services.mozilla.com.patch
patch -Np1 -i ../../firefox-52-disable-telemetry.patch

cd ../



  # mozconfig
  cat >.mozconfig <<END
ac_add_options --enable-application=mail
ac_add_options --enable-calendar

ac_add_options --prefix=/opt
ac_add_options --libdir=/opt
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"
#ac_add_options --enable-rust

# Branding

ac_add_options --with-branding=../mail/branding/nightly 
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux

# Keys


# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-libvpx
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --enable-alsa
ac_add_options --disable-updater
ac_add_options --disable-tests ###
ac_add_options --disable-debug-symbols ###

ac_add_options --disable-necko-wifi 
ac_add_options --disable-webspeech
ac_add_options --disable-webrtc

END
msg2 'fixing dependency errors'


patch -Np1 -i ../p.patch

cd mozilla

patch -Np1 -i ../../fix.patch
patch -Np1 -i ../../fix2.patch
}

build() {
  cd thunderbird-$pkgver

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # Export build path
  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  make -f client.mk build MOZ_PGO=1
  
  # Build
  msg2 "Running make -f client.mk build.."
  make -f client.mk build
}

package() {
  cd thunderbird-$pkgver

msg2 'fixing upstream error'


cd $srcdir/thunderbird-$pkgver

cp -r mail/branding/nightly other-licenses/branding/thunderbird 

msg2 'fixing upstream error 2'
cd other-licenses/branding/thunderbird
cp default16.png mailicon16.png
cp default22.png mailicon22.png
cp default24.png mailicon24.png
cp default32.png mailicon32.png
cp default48.png mailicon48.png
cp default64.png mailicon64.png
cp default128.png mailicon128.png
cp default256.png mailicon256.png

cd $srcdir/thunderbird-$pkgver
  # Install
  msg2 "Running make -f client.mk install.."
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  # vendor.js
  _vendorjs="$pkgdir/opt/$pkgname/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  _distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Thunderbird for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  # Icons
  for i in 16 22 24 32 48 256; do
    install -Dm644 other-licenses/branding/thunderbird/mailicon$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/opt/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /opt/$pkgname/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/opt/$pkgname/thunderbird-bin"

  # Use system certificates
  ln -srf "$pkgdir/usr/lib/libnssckbi.so" \
    "$pkgdir/opt/$pkgname/libnssckbi.so"
}
