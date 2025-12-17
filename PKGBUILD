# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=doudou-unstable
pkgver=1.0.0 # Not the Doudou version but the aur package version
pkgrel=1
pkgdesc="Stream your music with ease and style (unstable/development version). Source: https://gitlab.com/Openlyst/doudou"
arch=('x86_64')
url="https://gitlab.com/Openlyst/doudou"
license=('GPL3')
depends=('mpv' 'gtk3' 'libmpv.so')
makedepends=('curl' 'jq')
optdepends=()
provides=()
conflicts=()
options=('!strip')
source=()
sha256sums=()

_gitlab_project="Openlyst%2Fdoudou"
_gitlab_api="https://gitlab.com/api/v4"

pkgver() {
    # Fetch latest version from pubspec.yaml on main branch
    curl -sL "https://gitlab.com/Openlyst/doudou/-/raw/main/pubspec.yaml" | \
        grep '^version:' | sed 's/version: //g' | cut -d'+' -f1 | tr -d ' '
}

_get_latest_job_id() {
    # Get successful pipelines from main branch
    local pipelines=$(curl -sL "${_gitlab_api}/projects/${_gitlab_project}/pipelines?status=success&ref=main&per_page=20")
    
    # Find pipeline with successful build_release_linux job
    for pipeline_id in $(echo "$pipelines" | jq -r '.[].id' | head -10); do
        local jobs=$(curl -sL "${_gitlab_api}/projects/${_gitlab_project}/pipelines/${pipeline_id}/jobs?per_page=50")
        local job_id=$(echo "$jobs" | jq -r '.[] | select(.name=="build_release_linux" and .status=="success") | .id' | head -1)
        
        if [ -n "$job_id" ]; then
            echo "$job_id"
            return 0
        fi
    done
    
    return 1
}

prepare() {
    cd "${srcdir}"
    
    # Get the version
    local version=$(pkgver)
    echo "Detected version: $version"
    
    # Find the latest successful build job
    echo "Finding latest successful build_release_linux job..."
    local job_id=$(_get_latest_job_id)
    
    if [ -z "$job_id" ]; then
        echo "Error: Could not find a successful build_release_linux job"
        return 1
    fi
    
    echo "Found job ID: $job_id"
    
    # Download the artifact
    local artifact_url="https://gitlab.com/Openlyst/doudou/-/jobs/${job_id}/artifacts/raw/doudou-${version}-linux-x64.zip"
    echo "Downloading from: $artifact_url"
    
    curl -L -o "doudou-${version}-linux-x64.zip" "$artifact_url"
    
    # Extract
    unzip -o "doudou-${version}-linux-x64.zip"
}

package() {
    cd "${srcdir}/bundle"

    # Install the entire bundle to /opt/doudou-unstable (Flutter needs relative paths)
    install -d "${pkgdir}/opt/doudou-unstable"
    
    # Install main executable
    install -Dm755 "doudou" "${pkgdir}/opt/doudou-unstable/doudou"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/doudou-unstable/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/doudou-unstable/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/doudou-unstable/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/doudou-unstable.desktop" <<EOF
[Desktop Entry]
Name=Doudou (Unstable)
Comment=Stream your music with ease and style (unstable/development version)
Exec=/opt/doudou-unstable/doudou
Icon=doudou-unstable
Type=Application
Categories=Audio;Music;Player;
Keywords=music;streaming;audio;player;
EOF

    # Install icon
    install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/doudou-unstable.png"

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/doudou-unstable/doudou "${pkgdir}/usr/bin/doudou-unstable"
}
