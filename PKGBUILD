# Maintainer: Michael Behrens <mfbehrens@t-online.de>

# purple-pen -- Purple Pen, a course setting program for orienteering races.
# Stable release builds (matches the current upstream stable release tag
# "v400beta2"). Built from source as a framework-dependent .NET application,
# so it uses the system `dotnet` runtime at install time.
#
# The installed application uses the canonical upstream name "purplepen"
# (binary, /opt dir, desktop file, icons, MIME type), matching the official
# Linux .deb/.rpm/AppImage so that switching between the purple-pen,
# purple-pen-git and purple-pen-bin packages is clean.
#
# The desktop entry, AppStream metainfo and shared-mime-info definition are not
# hand-written here: they are rendered in prepare() from the templates in the
# source tree (src/Installer/LinuxInstaller/*.template), using the same
# substitutions as upstream's build-linux-packages.sh. See render_templates().
#
# The vendored PDFsharp project stamps version metadata with GitVersion.MsBuild,
# which requires git history that a source tarball does not have. It is disabled
# with -p:DisableGitVersionTask=true and the one source file that references the
# class it would generate is rewritten by purple-pen-no-gitversion.patch; see
# apply_no_gitversion_patch().

pkgname=purple-pen
pkgver=4.0.0.beta2
pkgrel=1
pkgdesc="Course setting program for orienteering races (4.0.0 beta 2)"
arch=(x86_64)
url="https://purple-pen.org"
license=(BSD)
depends=(dotnet-runtime icu libx11 libice libsm fontconfig xdg-utils)
makedepends=(dotnet-sdk)
provides=(purplepen="$pkgver")
conflicts=(purplepen)
options=(!strip)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/petergolde/PurplePen/archive/refs/tags/v400beta2.tar.gz"
        purple-pen-no-gitversion.patch)
sha256sums=('06d4843e3cee0d1b21bda264f86c44d021694a3647c9daa03c7bbafd52d55240'
            'b3fe4e5a44b18c1a7fb6fae9ec4a7eea145ed978490c545b646cb0f99e0ac202')

# Directory the source tarball extracts to.
_srcname="PurplePen-400beta2"
# Name of the produced executable (AvPurplePen <AssemblyName>).
_appname="PurplePen"
# Canonical upstream application name, used for install paths.
_prefix="purplepen"
# "/usr/bin/$_prefix" symlink target inside /opt.
_installdir="/opt/$_prefix"

# upstream_version: print the upstream package version (e.g. 4.0.0~beta2) derived
# from PurplePenCore/VersionNumber.cs, mirroring read_version() in
# build-linux-packages.sh. $1 = path to VersionNumber.cs.
upstream_version() {
    local _v _base _stage _seq _name
    _v="$(sed -n 's/.*Current[[:space:]]*=[[:space:]]*"\([0-9.]*\)".*/\1/p' "$1" | head -1)"
    _base="$(cut -d. -f1-3 <<<"$_v")"
    _stage="$(cut -d. -f4 <<<"$_v")"
    if [[ -z "$_stage" || "$_stage" -ge 500 ]]; then
        printf '%s' "$_base"; return
    fi
    _seq=$(( (_stage % 100) / 10 ))
    [[ "$_seq" -eq 0 ]] && _seq=""
    if   [[ "$_stage" -ge 300 ]]; then _name="rc"
    elif [[ "$_stage" -ge 200 ]]; then _name="beta"
    elif [[ "$_stage" -ge 100 ]]; then _name="alpha"
    else                               _name="dev"
    fi
    printf '%s~%s%s' "$_base" "$_name" "$_seq"
}

# render_templates: render purplepen.desktop, purplepen.metainfo.xml and
# purplepen.xml from the in-tree templates, substituting the same @TOKEN@
# placeholders as render_template() in build-linux-packages.sh. $1 = source
# tree root (the directory containing src/).
render_templates() {
    local _root="$1"
    local _tmpl="$_root/src/Installer/LinuxInstaller"
    local _date _ver

    if [[ -n "${SOURCE_DATE_EPOCH:-}" ]]; then
        _date="$(date -u -d "@$SOURCE_DATE_EPOCH" +%F)"
    else
        _date="$(date -u +%F)"
    fi
    _ver="$(upstream_version "$_root/src/PurplePenCore/VersionNumber.cs")"

    local -a _edits=(
        -e "s|@PACKAGE_NAME@|$_prefix|g"
        -e "s|@APP_NAME@|$_appname|g"
        -e "s|@DISPLAY_NAME@|Purple Pen|g"
        -e "s|@PACKAGE_SUMMARY@|Course setting program for orienteering|g"
        -e "s|@DESKTOP_CATEGORIES@|Graphics;2DGraphics;VectorGraphics;|g"
        -e "s|@DESKTOP_KEYWORDS@|orienteering;course;map;control;o-map;sport;race;coursesetting;|g"
        -e "s|@MIME_TYPE@|application/x-purplepen|g"
        -e "s|@MIME_TYPE_LINE@|MimeType=application/x-purplepen;|g"
        -e "s|@EXTRA_DESKTOP_KEYS@||g"
        -e "s|@INSTALL_PREFIX@|$_installdir|g"
        -e "s|@APPSTREAM_ID@|org.purple-pen.PurplePen|g"
        -e "s|@PACKAGE_LICENSE@|BSD-3-Clause|g"
        -e "s|@PACKAGE_URL@|https://purple-pen.org|g"
        -e "s|@VERSION@|$_ver|g"
        -e "s|@RELEASE_DATE@|$_date|g"
    )

    sed "${_edits[@]}" "$_tmpl/purplepen.desktop.template"     > "$srcdir/$_prefix.desktop"
    sed "${_edits[@]}" "$_tmpl/purplepen.appdata.xml.template" > "$srcdir/$_prefix.metainfo.xml"
    sed "${_edits[@]}" "$_tmpl/purplepen-mime.xml.template"    > "$srcdir/$_prefix.xml"

    # Fail the build if a placeholder was left unsubstituted, as upstream does.
    if grep -q '@[A-Z_]*@' "$srcdir/$_prefix.desktop" "$srcdir/$_prefix.metainfo.xml" "$srcdir/$_prefix.xml"; then
        printf 'error: unsubstituted @TOKEN@ left in generated integration files\n' >&2
        return 1
    fi
}

# license_from_source: write the full BSD-3-Clause license text to
# $srcdir/LICENSE, extracted from the license header comment at the top of
# $1 (a Purple Pen source file). Upstream ships no standalone LICENSE file in
# the distribution; the copyright file that the packages install defers to
# "the full license text in the source distribution", which is this header.
license_from_source() {
    sed -n '1,/^[[:space:]]*\*\/[[:space:]]*$/p' "$1" |
        sed -e 's|^/\*[[:space:]]*||' \
            -e 's|^[[:space:]]*\*/[[:space:]]*$||' \
            -e 's|^[[:space:]]*\*[[:space:]]*||' \
        > "$srcdir/LICENSE"
}

# apply_no_gitversion_patch: GitVersion.MsBuild, which the vendored PDFsharp
# project uses to stamp cosmetic version metadata, refuses to run without git
# history (exit 1) -- a source tarball has none. We cannot disable it alone,
# because PDFsharp references the GitVersionInformation class it generates.
# Instead, the purple-pen-no-gitversion.patch rewrites the single file in the
# built closure that references that type to use the version GitVersion itself
# reports when there is no tag (0.1.0), and the build passes
# -p:DisableGitVersionTask=true so the GitVersion tool never runs. $1 = source
# tree root (the directory containing src/).
apply_no_gitversion_patch() {
    local _root="$1"
    patch -p1 -d "$_root" -i "$srcdir/purple-pen-no-gitversion.patch"
}

prepare() {
    render_templates "$srcdir/$_srcname"
    license_from_source "$srcdir/$_srcname/src/PurplePenCore/VersionNumber.cs"
    apply_no_gitversion_patch "$srcdir/$_srcname"
}

build() {
    cd "$srcdir/$_srcname/src"

    # Keep .NET/NuGet state inside $srcdir so the build works when $HOME is not
    # writable (clean chroot) and nothing is left behind outside the build dir.
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_CLI_HOME="$srcdir/.dotnet"
    export NUGET_PACKAGES="$srcdir/.nuget/packages"

    # -p:DisableGitVersionTask=true turns off the vendored PDFsharp project's
    # GitVersion.MsBuild step, which needs git history a tarball does not have.
    # The purple-pen-no-gitversion.patch (applied in prepare()) supplies the
    # version values this would otherwise generate.
    #
    # In the 4.0.0 beta 2 source tree PdfConverter is not a ProjectReference of
    # AvPurplePen (it is built by a custom MSBuild target that runs during
    # publish), so `dotnet restore AvPurplePen` does not restore it. Restore it
    # explicitly so its obj/project.assets.json exists before publish -- without
    # this, publish fails with NETSDK1004 "project.assets.json not found".
    dotnet restore PdfConverter/PdfConverter.csproj \
        -p:DisableGitVersionTask=true --nologo

    # Framework-dependent (uses the system .NET runtime), plain net10.0 TFM,
    # RID linux-x64. UseAppHost=true produces the native `PurplePen` apphost;
    # DebugType=none matches the upstream Linux installer's settings.
    dotnet publish AvPurplePen/AvPurplePen.csproj \
        --configuration Release \
        --framework net10.0 \
        --runtime linux-x64 \
        --self-contained false \
        -p:UseAppHost=true \
        -p:DebugType=none \
        -p:DisableGitVersionTask=true \
        --nologo
}

package() {
    local _publish="$srcdir/$_srcname/src/AvPurplePen/bin/Release/net10.0/linux-x64/publish"

    # --- Application payload under /opt/$_prefix (mirrors upstream .deb/.rpm) ---
    #
    # The publish dir contains a runtimes/ tree holding native libraries (pdfium,
    # ...) for every platform the build carried along (~400 MB). As upstream's
    # publish-exclude.txt does, leave that tree out and instead flatten only the
    # linux-x64 native libraries into the payload root.
    install -d "$pkgdir$_installdir"
    local _entry
    shopt -s dotglob nullglob
    for _entry in "$_publish"/*; do
        [ "$(basename "$_entry")" = "runtimes" ] && continue
        cp -a "$_entry" "$pkgdir$_installdir/"
    done
    shopt -u dotglob nullglob
    if [ -d "$_publish/runtimes/linux-x64/native" ]; then
        cp -a "$_publish/runtimes/linux-x64/native/." "$pkgdir$_installdir/"
    fi
    # Ensure the main executable is executable.
    chmod 0755 "$pkgdir$_installdir/$_appname"

    # /usr/bin/purplepen symlink. .NET's apphost resolves its assemblies via
    # /proc/self/exe, which follows symlinks, so a symlink works with no wrapper.
    install -d "$pkgdir/usr/bin"
    ln -s "$_installdir/$_appname" "$pkgdir/usr/bin/$_prefix"

    # --- Icon set (hicolor + legacy pixmaps), from AvPurplePen/Assets/AppIcon ---
    local _iconroot="$srcdir/$_srcname/src/AvPurplePen/Assets/AppIcon"
    local _iconsize
    for _iconsize in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "$_iconroot/PurplePenBeta.${_iconsize}x${_iconsize}.png" \
            "$pkgdir/usr/share/icons/hicolor/${_iconsize}x${_iconsize}/apps/$_prefix.png"
    done
    install -Dm644 "$_iconroot/PurplePenBeta.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_prefix.svg"
    install -Dm644 "$_iconroot/PurplePenBeta.48x48.png" \
        "$pkgdir/usr/share/pixmaps/$_prefix.png"

    # --- Desktop entry (rendered in prepare() from the in-tree template) ---
    install -Dm644 "$srcdir/$_prefix.desktop" \
        "$pkgdir/usr/share/applications/$_prefix.desktop"

    # --- AppStream metainfo (rendered in prepare()) ---
    install -Dm644 "$srcdir/$_prefix.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/org.purple-pen.PurplePen.metainfo.xml"

    # --- MIME type for .ppen course files (rendered in prepare()) ---
    install -Dm644 "$srcdir/$_prefix.xml" \
        "$pkgdir/usr/share/mime/packages/$_prefix.xml"

    # --- License ---
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
