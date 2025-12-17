# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=klit-unstable
pkgver=1.0.0 # Not the Klit version but the aur package version
pkgrel=1
pkgdesc="The successor to BaoBao. A modern, privacy-focused client for the e621 community (unstable/development version). Source: https://gitlab.com/Openlyst/klit"
arch=('x86_64')
url="https://gitlab.com/Openlyst/klit"
license=('GPL3')
depends=('gtk3')
makedepends=('curl' 'jq')
optdepends=()
provides=()
conflicts=()
options=('!strip')
source=()
sha256sums=()

_gitlab_project="Openlyst%2Fklit"
_gitlab_api="https://gitlab.com/api/v4"

pkgver() {
    # Fetch latest version from pubspec.yaml on main branch
    curl -sL "https://gitlab.com/Openlyst/klit/-/raw/main/pubspec.yaml" | \
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
    local artifact_url="https://gitlab.com/Openlyst/klit/-/jobs/${job_id}/artifacts/raw/klit-linux-x64.zip"
    echo "Downloading from: $artifact_url"
    
    curl -L -o "klit-linux-x64.zip" "$artifact_url"
    
    # Extract
    unzip -o "klit-linux-x64.zip"
}

package() {
    cd "${srcdir}/bundle"

    # Install the entire bundle to /opt/klit-unstable (Flutter needs relative paths)
    install -d "${pkgdir}/opt/klit-unstable"
    
    # Install main executable
    install -Dm755 "klit" "${pkgdir}/opt/klit-unstable/klit"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/klit-unstable/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/klit-unstable/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/klit-unstable/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/klit-unstable.desktop" <<EOF
[Desktop Entry]
Name=Klit (Unstable)
Comment=A modern, privacy-focused client for the e621 community (unstable/development version)
Exec=/opt/klit-unstable/klit
Icon=klit-unstable
Type=Application
Categories=Network;Graphics;
Keywords=e621;booru;privacy;
EOF

    # Install icon (if available)
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/klit-unstable.png"
    fi

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/klit-unstable/klit "${pkgdir}/usr/bin/klit-unstable"
}
