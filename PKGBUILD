# Maintainer: Buck <kbuck at tuta dot io>
#
# Zenworks: a desktop environment built on Quickshell and Hyprland.
# Nothing is compiled: the shell, its Hyprland and kitty configs and the
# suite's helpers are copied to /usr/share/zenworks, the session's launcher
# to /usr/bin, and the login-screen entry, portal choice and app launchers
# to /usr/share. What a user changes lives in ~/.config/zenworks.

pkgname=zenworks
pkgver=0.1.7
pkgrel=1
pkgdesc="A desktop environment built on Quickshell and Hyprland"
arch=('any')
url="https://github.com/kbuckleys/Zenworks"
license=('GPL-3.0-or-later')
depends=(
  # compositor & session
  hyprland hyprshutdown hyprpolkitagent polkit xcursor-pro-hyprcursor xcursor-pro-cursor-theme
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-desktop-portal-termfilechooser
  xdg-utils xdg-terminal-exec xdg-user-dirs
  # the shell
  quickshell qt6-declarative qt6-imageformats qt6-multimedia qt6-multimedia-ffmpeg
  kimageformats libqalculate
  # the suite's Python side (delphi, calypso, clio, terminus' network places,
  # picasso's cut-out)
  python python-gobject python-numpy python-pillow python-scipy python-onnxruntime-cpu
  # audio, media & documents
  pipewire pipewire-pulse wireplumber libpulse alsa-utils pamixer playerctl
  gst-plugins-good gst-plugins-bad gst-plugins-ugly
  ffmpeg mpv imagemagick perl-image-exiftool poppler ghostscript djvulibre
  hunspell hunspell-en_us
  # a laptop's screen brightness (Control Hub; monitors go through ddcutil)
  brightnessctl
  # wayland utilities
  wl-clipboard wl-clip-persist cliphist grim slurp wf-recorder wtype libnotify
  # files, archives & disks
  fd fzf ripgrep bat jq file attr inotify-tools rsync diffutils
  7zip zip unzip libarchive fuse3 udisks2 ntfs-3g exfatprogs dosfstools
  # terminal, editor, git
  kitty neovim git curl
  # packages & system
  paru pacman-contrib expac gawk glib2 gtk3
  # other apps in the shell's colors
  adw-gtk-theme qt6ct
  # fonts
  fontconfig noto-fonts noto-fonts-emoji ttf-jetbrains-mono-nerd ttf-dseg unicode-emoji
  otf-san-francisco otf-san-francisco-mono
)
optdepends=(
  'zsh: the terminal setup Zenworks offers (installed when you accept it)'
  'zoxide: the terminal setup Zenworks offers (installed when you accept it)'
  'noto-fonts-cjk: Chinese, Japanese and Korean text'
  'noto-fonts-extra: more weights and rare scripts'
  'tesseract: copying text out of a picture (Picasso)'
  'tesseract-data-eng: copying English text out of a picture'
  'unrar: opening RAR archives in Terminus'
  'ratarmount: browsing big archives without unpacking them'
  'ntfsprogs: repairing and formatting NTFS drives'
  'btrfs-progs: formatting Btrfs drives'
  'xfsprogs: formatting XFS drives'
  'f2fs-tools: formatting F2FS drives'
  'solaar: Logitech mice and keyboards'
  'bandwhich: network use per app in Zeus'
  'iotop: disk use per process in Zeus'
  'flatpak: the App Store in Ceres, once you opt in'
  'github-cli: signing in to GitHub in Delphi'
  'nodejs: the test suite (Oracle > Health > Tests)'
  'openssh: SSH keys and SSH remotes in Delphi (installed when first needed)'
  'ddcutil: monitor brightness in Control Hub (installed when first needed)'
  'hyprsunset: night light in Control Hub (installed when first needed)'
  'fwupd: firmware updates in Hestia (installed when first needed)'
  'qt6-webengine: PDFs in Minerva (installed when the first PDF is opened)'
  'python-pykeepass: KeePassXC vaults in Calypso (installed when first needed)'
  'fcitx5: typing Chinese, Japanese, Korean and more (installed when Input methods is turned on)'
)
# zen-browser (the AUR's source build) installs /usr/bin/zen as well
conflicts=('zen-browser')
backup=('etc/xdg/xdg-desktop-portal-termfilechooser/ZENWORKS')
install=zenworks.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cdb1b3a134013ff59891aa92ec50bab601afb9c832443b01009ef53cd00022d3')

package() {
  # the tarball's directory is named after the repository, as GitHub has
  # it now (renamed ZENWORKS → Zenworks after 0.0.7-1 was built): read
  # from $url, so a rename cannot break the build again
  cd "${url##*/}-$pkgver"
  local share="$pkgdir/usr/share/zenworks"

  install -dm755 "$share"
  cp -r --no-preserve=ownership,mode config/. "$share/"
  find "$share" -name __pycache__ -prune -exec rm -rf {} +

  # Modes from what each file is, not from the tarball: a repository
  # uploaded through a forge's web page loses its executable bits. Scripts,
  # the apps' launchers and anything starting with #! (scripts/tether) run;
  # everything else is read.
  find "$share" -type d -exec chmod 755 {} +
  find "$share" -type f -exec chmod 644 {} +
  find "$share" -type f \( -name '*.sh' -o -name '*.py' -o -path '*/bin/*' \) -exec chmod 755 {} +
  find "$share" -type f -exec sh -c '
    for f; do [ "$(head -c2 "$f")" = "#!" ] && chmod 755 "$f"; done; exit 0' sh {} +

  # Python cannot write its cache into a read-only /usr, so it is made here
  python -m compileall -q -s "$pkgdir" -p / "$share"

  # the session's launcher is `zen`; `zenworks`, its name up to 0.0.5, links to it
  install -Dm755 bin/zen "$pkgdir/usr/bin/zen"
  ln -s zen "$pkgdir/usr/bin/zenworks"
  install -Dm644 share/wayland-sessions/zenworks.desktop -t "$pkgdir/usr/share/wayland-sessions"
  install -Dm644 share/xdg-desktop-portal/zenworks-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal"
  install -Dm644 share/applications/*.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 etc/xdg/xdg-desktop-portal-termfilechooser/ZENWORKS \
    -t "$pkgdir/etc/xdg/xdg-desktop-portal-termfilechooser"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
