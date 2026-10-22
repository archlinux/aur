# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=filee-git
pkgver=2.0.0.r14.g014e851
pkgrel=1
pkgdesc="Offline file converter for images, PDF, Office, HWP, video, audio, e-books and archives (git)"
arch=('x86_64')
url="https://github.com/KnifeLemon/Filee"
license=('MIT')
# Framework-dependent build, so Arch's .NET runtime replaces the one upstream
# bundles. The rest are the system libraries upstream's INSTALL.txt lists.
depends=('dotnet-runtime-10.0' '7zip' 'glibc' 'gcc-libs' 'openssl' 'krb5'
         'fontconfig' 'freetype2' 'libx11' 'libice' 'libsm' 'libxrandr'
         'libxkbcommon' 'libxi' 'libxtst' 'libxt' 'libinput' 'systemd-libs'
         'wayland' 'hicolor-icon-theme')
# rust: rhwp. python: reads the font list from upstream's PowerShell script.
makedepends=('dotnet-sdk-10.0' 'rust' 'git' 'python')
# Filee cannot download LibreOffice and Ghostscript on Linux. The others it
# can download itself, but it uses a system copy when there is one.
optdepends=('libreoffice: Office documents'
            'ghostscript: PostScript and PDF compression'
            'ffmpeg: video and audio'
            'pandoc-cli: more document formats'
            'calibre: e-books'
            'noto-fonts-cjk: Korean, Chinese and Japanese text')
provides=('filee')
conflicts=('filee')
options=('!strip' '!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$pkgname"

  # The UI fonts are not in git. Upstream's build/fetch-fonts.ps1 pins each
  # one by URL and SHA-256. PowerShell is not in the Arch repos, so the list
  # is read from that script and fetched with curl.
  python3 - build/fetch-fonts.ps1 > "$srcdir/fonts.txt" << 'EOF'
import re, sys
text = open(sys.argv[1], encoding="utf-8").read()
variables = {}
expand = lambda s: re.sub(r"\$(\w+)", lambda m: variables[m.group(1)], s)
for name, value in re.findall(r"""^\$(\w+) = ["']([^"']*)["']\s*$""", text, re.M):
    variables[name] = expand(value)
fonts = re.findall(r"""^\s*'([^']+)'\s*=\s*@\("([^"]+)", '([0-9A-Fa-f]{64})'\)""", text, re.M)
if not fonts:
    sys.exit("no fonts found in " + sys.argv[1])
for name, url, sha in fonts:
    print(name, expand(url), sha.lower())
EOF
  local _font _url _sha
  mkdir -p src/Filee.App/Assets/Fonts
  while read -r _font _url _sha; do
    curl -fsSL -o "src/Filee.App/Assets/Fonts/$_font" "$_url"
    echo "$_sha  src/Filee.App/Assets/Fonts/$_font" | sha256sum -c --quiet
  done < "$srcdir/fonts.txt"

  # rhwp turns HWP and HWPX into PDF. Filee only runs its own copy in
  # engines/rhwp, so it is built here from the commit that upstream's Linux
  # build pins in build/build-linux-native.py.
  local _commit
  _commit=$(grep -Po '^RHWP_COMMIT = "\K[0-9a-f]{40}' build/build-linux-native.py)
  rm -rf "$srcdir/rhwp"
  git init -q "$srcdir/rhwp"
  git -C "$srcdir/rhwp" fetch -q --depth 1 https://github.com/edwardkim/rhwp "$_commit"
  git -C "$srcdir/rhwp" checkout -q --detach FETCH_HEAD

  cd "$srcdir/rhwp"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  # keep NuGet's cache inside the build tree instead of ~/.nuget
  export NUGET_PACKAGES="$srcdir/nuget"

  # Same publish as upstream's build/build-portable.ps1, but not
  # self-contained. NuGet restores from nuget.org here, so build() needs
  # network access.
  local _project
  for _project in Filee.App Filee.Cli; do
    dotnet publish "src/$_project/$_project.csproj" -c Release -r linux-x64 \
      --self-contained false -p:FileeRelease=true -p:PublishReadyToRun=false \
      -o "$srcdir/publish"
  done

  cd "$srcdir/rhwp"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --bin rhwp
}

package() {
  install -d "$pkgdir/opt/filee"
  cp -a "$srcdir/publish/." "$pkgdir/opt/filee/"

  install -Dm755 "$srcdir/rhwp/target/release/rhwp" "$pkgdir/opt/filee/engines/rhwp/rhwp"
  install -Dm644 "$srcdir/rhwp/LICENSE" "$pkgdir/opt/filee/engines/rhwp/LICENSE"
  # Arch's 7-Zip instead of the copy upstream bundles. Its 7z starts the
  # full program with every format, which is what upstream's 7zz is.
  install -d "$pkgdir/opt/filee/engines/7zip"
  ln -s /usr/bin/7z "$pkgdir/opt/filee/engines/7zip/7zz"

  # same command name as upstream's install.sh gives the CLI
  install -d "$pkgdir/usr/bin"
  ln -s /opt/filee/filee-cli "$pkgdir/usr/bin/filee"

  cd "$pkgname"

  # the entry upstream's install.sh writes, with the path of this package
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.filee.app.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Filee
Comment=Convert files offline
Exec=/opt/filee/Filee --convert %F
Icon=filee
Terminal=false
Categories=Utility;
StartupWMClass=Filee
EOF
  install -Dm644 src/Filee.App/Assets/Icons/filee.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/filee.png"

  # KWin script for the experimental Wayland gesture, so Plasma users can
  # turn it on in System Settings
  install -d "$pkgdir/usr/share/kwin/scripts"
  cp -r installer/linux/kwin/filee-donut "$pkgdir/usr/share/kwin/scripts/"

  install -Dm644 LICENSE THIRD-PARTY-NOTICES.md -t "$pkgdir/opt/filee"
  install -Dm644 LICENSE THIRD-PARTY-NOTICES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
