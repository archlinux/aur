# List all recipes
default:
    @just --list

# Check for updates from GitHub
check:
    #!/usr/bin/env bash
    current_ver=$(grep -oP '^pkgver=\K.*' PKGBUILD)
    latest_ver=$(curl -s https://api.github.com/repos/badlogic/pi-mono/releases/latest | jq -r '.tag_name' | sed 's/^v//')
    if [ "$current_ver" = "$latest_ver" ]; then
        echo "pi-bin is up to date ($current_ver)"
    else
        echo "New version available: $current_ver -> $latest_ver, run 'just update' to update PKGBUILD and checksums."
    fi

# Update PKGBUILD and checksums
update:
    #!/usr/bin/env bash
    current_ver=$(grep -oP '^pkgver=\K.*' PKGBUILD)
    latest_ver=$(curl -s https://api.github.com/repos/badlogic/pi-mono/releases/latest | jq -r '.tag_name' | sed 's/^v//')
    if [ "$current_ver" = "$latest_ver" ]; then
        echo "Already at the latest version ($current_ver)."
    else
        echo "Updating to $latest_ver..."
        sed -i "s/^pkgver=.*/pkgver=$latest_ver/" PKGBUILD
        sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
        updpkgsums
        makepkg --printsrcinfo > .SRCINFO
        echo "PKGBUILD and .SRCINFO updated to version $latest_ver."
    fi

# Build the package
build:
    makepkg && makepkg --printsrcinfo > .SRCINFO

# Install locally
install:
    sudo pacman -U pi-bin-*.pkg.tar.zst

# Uninstall locally
uninstall:
    sudo pacman -R pi-bin

# Push to GitHub (full) and AUR (packaging only)
push:
    #!/usr/bin/env bash
    set -e
    [[ -d .git ]] || { git -c init.defaultBranch=master init; git remote add origin ssh://aur@aur.archlinux.org/pi-bin.git; git remote add github git@github.com:skorotkiewicz/pi-mono-arch.git; }

    # GitHub (All)
    git checkout -B dev 2>/dev/null
    git add . && git commit -m "update: $(grep -oP '^pkgver=\K.*' PKGBUILD)" || true
    git push -u github dev

    # AUR (Subset)
    git checkout -B master 2>/dev/null
    git checkout dev -- PKGBUILD .SRCINFO
    git add PKGBUILD .SRCINFO
    
    if ! git diff-index --quiet HEAD --; then
        git commit -m "aur: $(grep -oP '^pkgver=\K.*' PKGBUILD)"
        git push -u origin master
    else
        echo "AUR up to date."
    fi

    git checkout dev
    
# Clean build artifacts
clean:
    rm -rf src/ pkg/ *.tar.gz *.tar.zst
