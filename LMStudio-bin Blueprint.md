PROJECT BLUEPRINT: lmstudio-bin Maintenance Framework

1. Executive Summary

Project Name: lmstudio-bin

Target Platform: Arch Linux (AUR)

Upstream Software: LM Studio (Proprietary AppImage)

This project provides an Arch User Repository (AUR) package for LM Studio. It employs a "Maintenance Bridge" architecture to convert dynamic upstream releases into deterministic, security-verified Arch Linux packages while adhering strictly to Arch Linux packaging standards for binary software.

2. Core Objectives

Correct Naming Convention: Utilize the -bin suffix as mandated by AUR guidelines for software distributed as pre-compiled binaries.

Replacement of Legacy Packages: Explicitly provide and conflict with the abandoned lmstudio package to ensure a clean migration path for the community.

Security & Determinism: Implement strict SHA256 checksum verification for every release, preventing "moving target" build failures.

Full Desktop Integration: Ensure high-resolution icon support, XDG-compliant desktop entries, and taskbar grouping (StartupWMClass).

3. Technical Architecture

A. The Maintenance Engine (update_package.py)

The heart of the project is a Python-based automation script that manages the lifecycle of a release.

URL Resolution: Follows the latest redirect to identify the specific build version.

Verification: Downloads the AppImage and calculates the SHA256 hash.

Template Rendering: Injects metadata into PKGBUILD.template to produce a valid PKGBUILD.

Metadata Generation: Automatically updates .SRCINFO for AUR indexing.

B. Packaging Logic (PKGBUILD)

The build process follows a specific lifecycle to ensure stability:

Extraction Stage: Uses --appimage-extract within a temporary sandbox to access internal assets.

Icon Strategy (Static Vendoring):
* Static Icon: The high-resolution (512x512) icon is vendored as `lmstudio.png` in the base repository.
* Optimization: Icons must be optimized to stay under the 500KB AUR repository blob limit.
* Rationale: Static vendoring prevents build-time extraction failures and ensures consistent visual presentation across versions without relying on internal AppImage layout stability.

Binary Placement: Installs the AppImage to /opt/lm-studio/ and provides a symbolic link at /usr/bin/lm-studio.

C. Lifecycle Management (.install)

The .install script ensures the host system recognizes changes immediately upon installation, upgrade, or removal by triggering:

update-desktop-database (Applications menu)

gtk-update-icon-cache (Visual assets)

4. Automation Workflow (For Orchestrator Reference)

When updating to a new version, the orchestrator should follow this sequence:

Sync: Pull latest changes from the AUR remote.

Execute: Run ./update_package.py to fetch upstream changes and regenerate files.

Validate: * Verify PKGBUILD version matches upstream.

Run makepkg -f to test the build locally.

Inspect pkg/ directory to ensure icon assets are present at /usr/share/icons/hicolor/512x512/apps/lmstudio-bin.png.

Publish: * Refresh .SRCINFO (makepkg --printsrcinfo > .SRCINFO).

Commit PKGBUILD, .SRCINFO, lmstudio.desktop, lmstudio.png, and lmstudio-bin.install.

Push to origin master.

5. Git Hygiene & AUR Constraints

* Blob Limit: The AUR imposes a strict 512KB limit on individual file blobs. All vendored assets (like `lmstudio.png`) must be optimized to comply.
* Tracking Restrictions: Only source-of-truth files and metadata are permitted in the repository. Tracking of `src/` or `pkg/` directories is strictly prohibited.
* Verification: Use `verify_git_hygiene.sh` to audit the repository state before pushing to the AUR remote.

6. Directory Structure

.
├── PKGBUILD                # Generated Arch Linux build script
├── PKGBUILD.template       # Blueprint for the maintenance engine
├── .SRCINFO                # AUR metadata index (auto-generated)
├── lmstudio.desktop        # Desktop integration file
├── lmstudio.png            # Static vendored icon (512x512)
├── lmstudio-bin.install    # Post-install hooks for cache clearing
├── update_package.py       # The Maintenance Engine script
├── verify_git_hygiene.sh   # Hygiene enforcement script
└── LMStudio-bin Blueprint.md # This reference document


7. Maintenance Contacts & Authority

Maintainer: madgoat (AUR)

Package URL: https://aur.archlinux.org/packages/lmstudio-bin
