# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmm

# The repository is not named after the package, so the tarball extracts to
# markdown-mixed-media-$pkgver.
_repo=markdown-mixed-media
pkgver=1.1.1
pkgrel=1
pkgdesc="Markdown Mixed Media - A powerful terminal markdown viewer with image support, Mermaid diagrams, and PDF/ODT export"
arch=('any')
url="https://github.com/aaronsb/markdown-mixed-media"
license=('MIT')
depends=('nodejs>=22')
optdepends=(
    'chafa: Terminal image rendering support'
    'mermaid-cli: Mermaid diagram rendering'
    'chromium: PDF generation support'
)
makedepends=('npm' 'git')
options=('!strip')  # Don't strip binaries to avoid fakeroot issues
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/markdown-mixed-media/archive/v$pkgver.tar.gz")
sha256sums=('c5e8923692c9dfc7a83763054effcfb489931be2e422196851b294173526aaf2')

build() {
    cd "$srcdir/${_repo}-$pkgver"

    # puppeteer is an optionalDependency (runtime-detected). Skip its bundled
    # Chromium download — users install system chromium (see optdepends).
    # This also makes the build work on architectures where puppeteer has no
    # prebuilt Chrome binary (e.g. aarch64).
    export PUPPETEER_SKIP_DOWNLOAD=true

    # npm ci, not npm install: it installs exactly what package-lock.json
    # records and fails rather than resolving something new. This package is
    # built in a clean container and signed with a repository key, and a
    # signature over a tree resolved fresh from the registry each time attests
    # to nothing in particular.
    #
    # (.npmrc sets legacy-peer-deps for marked-emoji compat)
    npm ci

    # Build the project
    npm run build

    # Create the executable
    npm run build:simple

    # package() copies node_modules wholesale, so without this the build
    # toolchain ships to users: typescript, tsx, and the 11 MB esbuild binary
    # tsx pulls in. Run after the builds, which need them.
    npm prune --omit=dev
}

package() {
    cd "$srcdir/${_repo}-$pkgver"

    # Create directories
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"

    # Copy built files
    cp -r dist "$pkgdir/usr/lib/$pkgname/"
    cp package.json "$pkgdir/usr/lib/$pkgname/"

    # Copy node_modules but exclude problematic binaries
    cp -r node_modules "$pkgdir/usr/lib/$pkgname/"

    _nm="$pkgdir/usr/lib/$pkgname/node_modules"

    # This package is arch=('any'), so anything ELF inside it is a prebuild for
    # one platform shipped to every platform. Detected by content rather than by
    # extension, because the extension list this replaces caught one file of
    # three: libvips-cpp.so.42 has a versioned soname no '*.so' glob matches,
    # and @esbuild/linux-x64/bin/esbuild has no extension at all. 26.6 MB
    # between them, against 0.3 MB for the one that did match.
    #
    # With sharp gone and devDependencies pruned there is nothing left for this
    # to find. It stays as the guard that keeps arch=('any') true when a future
    # dependency arrives carrying a prebuild.
    while IFS= read -r -d '' f; do
        if [ "$(head -c4 -- "$f")" = "$(printf '\177ELF')" ]; then
            rm -f -- "$f"
        fi
    done < <(find "$_nm" -type f -size +4c -print0)

    # Dependencies ship their own build tooling. katex carries src/metrics and
    # src/fonts — scripts it uses to regenerate font metrics during its own
    # development, in Python and in Perl. Nothing here runs them, but namcap
    # reads their shebangs and concludes the package depends on both.
    #
    # The directories go, rather than a list of extensions. Two of the three
    # files namcap named — makeFF and makeBlacker — have no extension at all,
    # which is the same way the ELF sweep above lost 26 MB before it stopped
    # matching on names.
    rm -rf "$_nm/katex/src/metrics" "$_nm/katex/src/fonts"

    # npm prune leaves the directories of the packages it removed.
    find "$_nm" -type d -empty -delete 2>/dev/null || true

    # Create wrapper script
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/usr/bin/env node
import '/usr/lib/$pkgname/dist/index-direct.js';
EOF

    # Make executable
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
