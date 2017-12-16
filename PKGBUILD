# Maintainer: Koopa <thekoopakingdom@gmail.com>

# Verification:
# - All scripts are ran through ShellCheck (Ignoring PKGBUILD related false positives.).
# - This PKGBUILD in particular is ran through namcap.
# - Desktop entries are ran through desktop-file-validate.

pkgname='lucas-simpsons-hit-and-run-mod-launcher'
pkgver='1.16.2'
pkgrel='1'
pkgdesc="Mod launcher for The Simpsons: Hit & Run."
arch=(
    'x86_64'
    'i686'
)
url="https://donutteam.com/"
# The mod launcher uses the ZLIB and Lua licenses, but it doesn't make sense to redownload them for
# this because said licenses should be managed by Linux packages, and Windows licenses left up to
# the Windows app to display. The mod launcher itself has no particular license.
license=('unknown')
depends=(
    # Zenity is needed for the mod launcher script's dialogs shown while installing the runtime.
    'zenity'
    # Wine is needed to run the mod launcher. Currently limited to staging due to a bug in Wine
    # stable that prevents .NET 2.0 SP2 from being installed.
    'wine'
    # Wine's Mono implementation is needed for booting up an instance of Wine.
    'wine-mono'
    # Wine's Gecko implementation is needed for booting up an instance of Wine.
    'wine_gecko'
    # Winetricks is needed to install the .NET 3.5 SP1 runtime required by the mod launcher.
    'winetricks'
)
source=(
    "$pkgname.zip::https://donutteam.com/apps/\
Lucas'%20Simpsons%20Hit%20&%20Run%20Mod%20Launcher%20${pkgver}.zip"
    "$pkgname.sh"
    "the-simpsons-hit-and-run.sh"
    "$pkgname.xml"
    "$pkgname.png"
    "the-simpsons-hit-and-run.png"
    "com.donutteam.$pkgname.desktop"
    "the-simpsons-hit-and-run.desktop"
    "check-for-duplicate-lmlms.sh"
)
md5sums=(
    "e5007494840121bdd0bc2431146858e6"  # Mod launcher ZIP archive.
    "eadcf24b2aa741cbd6e8ba4b2a2a0671"  # Mod launcher launcher Bash script.
    "118c8447bee61faba9126b33067799b7"  # SHAR launcher Bash script.
    "5cb3ea57491d4252d1e5473c365eb187"  # LMLM/LMLH XML MIME type.
    "28fcaf84f934fe0d7ce0320bc670d1e0"  # Mod launcher PNG icon.
    "4d1053736cc3616ae09c3b3829f3306c"  # SHAR launcher PNG icon.
    "179ffc615c04ddf4c8bcc8ca567264f7"  # Mod launcher desktop entry.
    "6b67d38033e5f6f962485e5e9ae9a74c"  # SHAR launcher desktop entry.
    "a7952fc64976886f82e00b684bb888e8"  # LMLM duplicate checking Bash script.
)

package() {
  # Fullscreen: never use the game's fullscreen. Use the resizeable window hack, and your DE's
  # native fullscreen function.

  # Install the mod launcher files.

  # Install the Windows executable to /usr/lib/lucas-simpsons-hit-and-run-mod-launcher/ because it's
  # an executable, but not meant to be ran as-is.
  install -Dm644 "Lucas Simpsons Hit & Run Mod Launcher.exe" "$pkgdir/usr/lib/$pkgname/$pkgname.exe"
  # Install the default hacks to /usr/lib/lucas-simpsons-hit-and-run-mod-launcher/hacks/ because
  # they are, in a sense, shared objects injected into the game, just in a format for the launcher
  # Despite this, the permissions for group and other are still set to non-executable because
  # are techincally not ordinary shared objects.
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/hacks/" Hacks/*.lmlh
  # Install the default mods to /usr/share/lucas-simpsons-hit-and-run-mod-launcher/mods/ because
  # they aren't really shared objects, but just data like textures and models.
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/mods/" Mods/*.lmlm

  # Install the launchers.

  install -Dm655 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -m655 "the-simpsons-hit-and-run.sh" "$pkgdir/usr/bin/the-simpsons-hit-and-run"

  # Install the MIME types.

  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  # Install the icons.

  # At one point, I conisdered installing multiple icon sizes, but went against it because the
  # downscaled icons didn't look great, so only the original high quality icons are installed. This
  # is the original code for installing a few different sizes:
  # for SIZE in 16 32 48 64 128 256; do
  #   install -Dm644 "$pkgname-$SIZE.png" \
  #       "$pkgdir/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/$pkgname.png"
  #   install -Dm644 "the-simpsons-hit-and-run-$SIZE.png" \
  #       "$pkgdir/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/the-simpsons-hit-and-run.png"
  # done

  # And here's some code to run in your shell to generate some downscaled images with ImageMagick.
  # for SIZE in 16 32 48 64 128 256; do
  #   convert -resize $SIZEx$SIZE
  #       the-simpsons-hit-and-run-256.png the-simpsons-hit-and-run-$SIZE.png
  # done
  install -Dm644 "$pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -m644 "the-simpsons-hit-and-run.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/the-simpsons-hit-and-run.png"

  # Install the desktop entries.

  install -Dm644 "com.donutteam.$pkgname.desktop" \
      "$pkgdir/usr/share/applications/com.donutteam.$pkgname.desktop"
  install -m644 "the-simpsons-hit-and-run.desktop" \
      "$pkgdir/usr/share/applications/the-simpsons-hit-and-run.desktop"

  # Install the helper script.

  install -m655 "check-for-duplicate-lmlms.sh" "$pkgdir/usr/bin/check-for-duplicate-lmlms"
}
