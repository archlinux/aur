# Maintainer: Koopa <thekoopakingdom@gmail.com>

# Verification:
# - All scripts are ran through ShellCheck (Ignoring PKGBUILD related false positives.).
# - This PKGBUILD in particular is ran through namcap.
# - Desktop entries are ran through desktop-file-validate.

pkgname='lucas-simpsons-hit-and-run-mod-launcher'
pkgver='1.23.9'
pkgrel='1'
pkgdesc="Mod launcher for The Simpsons: Hit & Run."
arch=(
    'x86_64'
    'i686'
)
url="https://donutteam.com/"
# The mod launcher uses libraries under the ZLIB and Lua licenses, but it doesn't make sense to
# bundle them with this package because said licenses should be managed by their respective Linux
# packages (e.g. the TinyXML ZLIB license installed by the Linux zlib package.) and Windows licenses
# left up to the Windows program to display.
# The mod launcher itself has no particular license.
license=('unknown')
depends=(
    # Zenity is needed for the mod launcher launcher's dialogs shown while installing the runtime.
    'zenity'
    # Wine is needed to run the mod launcher.
    'wine'
    # Winetricks is needed to install the .NET 3.5 SP1 runtime required by the mod launcher.
    'winetricks'
)
source=(
    # TODO: Add the package version here to the saved file name too!
    # Official mod launcher download for the current release.
    "$pkgname-${pkgver}.zip::https://cdn.donutteam.com/Downloads/Tools/\
Lucas'%20Simpsons%20Hit%20&%20Run%20Mod%20Launcher%20${pkgver}.zip"
    # Unofficial mod launcher Linux launcher download for the latest master branch.
    # TODO: release these in lockstep with the launcher?
    "$pkgname-linux-launcher.zip::https://gitlab.com/CodingKoopa/\
lucas-simpsons-hit-and-run-mod-launcher-linux-launcher/-/archive/master/\
lucas-simpsons-hit-and-run-mod-launcher-linux-launcher-master.zip"
)
md5sums=(
    # Skip the mod launcher ZIP because no hashes are provided by upstream.
    "SKIP"
    # SKip the mod launcher Linux launcher ZIP because the latest master is subject to change.
    "SKIP"
)

package() {
  # Stage 1: Install the mod launcher files.

  # Install the Windows executable to /usr/lib/lucas-simpsons-hit-and-run-mod-launcher/ because it's
  # an executable, but not meant to be ran as-is.
  install -Dm644 "Lucas Simpsons Hit & Run Mod Launcher.exe" "$pkgdir/usr/lib/$pkgname/$pkgname.exe"
  # Install the default hacks to /usr/lib/lucas-simpsons-hit-and-run-mod-launcher/dlls for the same
  # reason.
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/dlls/" DLLs/*
  # Install the default mods to /usr/share/lucas-simpsons-hit-and-run-mod-launcher/mods/ because
  # they aren't really shared objects, but just data like textures and models.
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/mods/" Mods/*.lmlm

  # Stage 2: Install the mod launcher Linux launcher files.
  cd "$pkgname-linux-launcher-master"

  # Install the launchers.

  install -Dm655 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -m655 "the-simpsons-hit-and-run.sh" "$pkgdir/usr/bin/the-simpsons-hit-and-run"

  # Install the MIME types.

  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  # Install the icons.

  for SIZE in 16 22 32 48 64 256; do
    install -Dm644 "$pkgname-$SIZE.png" \
        "$pkgdir/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/$pkgname.png"
    install -Dm644 "the-simpsons-hit-and-run-$SIZE.png" \
        "$pkgdir/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/the-simpsons-hit-and-run.png"
  done

  # Install the desktop entries.

  install -Dm644 "com.donutteam.$pkgname.desktop" \
      "$pkgdir/usr/share/applications/com.donutteam.$pkgname.desktop"
  install -m644 "the-simpsons-hit-and-run.desktop" \
      "$pkgdir/usr/share/applications/the-simpsons-hit-and-run.desktop"

  # Install the helper script.

  install -m655 "check-for-duplicate-lmlms.sh" "$pkgdir/usr/bin/check-for-duplicate-lmlms"
}
