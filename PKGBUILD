# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>

pkgname=ut2004-data-archiveorg
pkgver=3369
pkgrel=1
pkgdesc="Unreal Tournament 2004 ECE data from Archive.org ISO"
arch=('any')
url="https://archive.org/details/ut-2004"
license=('custom')
depends=()
makedepends=('p7zip' 'unshield')
provides=('ut2004-data')
conflicts=('ut2004-data' 'ut2004-steam' 'ut2004-gog')
source=("UT2004.ISO::https://archive.org/download/ut-2004/UT2004.ISO")
md5sums=('7841d8750e3f51aeac7bbb0448667670')

package() {
    # Making sure directories exist.
    install -d "$pkgdir/opt/ut2004"

    # Extract ISO data to a temporary directory
    msg2 "Extracting ISO..."
    mkdir -p "$srcdir/iso_extract"
    7z -y x "$srcdir/UT2004.ISO" -o"$srcdir/iso_extract"
    
    # Extract InstallShield Cabinet files
    msg2 "Preparing Cabinet files..."
    # The cab files are split across Disk* folders. unshield needs them in one place.
    # We consolidate them into a single directory using symlinks to save space/time.
    mkdir -p "$srcdir/cab_files"
    find "$srcdir/iso_extract" -name "data*.cab" -exec ln -sf {} "$srcdir/cab_files/" \;
    find "$srcdir/iso_extract" -name "data*.hdr" -exec ln -sf {} "$srcdir/cab_files/" \; 2>/dev/null || true
    
    msg2 "Extracting Cabinet files..."
    mkdir -p "$srcdir/cab_extract"
    # Extracting data1.cab should automatically trigger extraction of subsequent parts
    # if they are in the same directory.
    if [ -f "$srcdir/cab_files/data1.cab" ]; then
        unshield -d "$srcdir/cab_extract" x "$srcdir/cab_files/data1.cab"
    else
        error "data1.cab not found!"
        return 1
    fi
    
    # Organize extracted files (remove All_ prefix and map directories)
    msg2 "Organizing extracted files..."
    cd "$srcdir/cab_extract"
    
    # Iterate through extracted groups (e.g., All_Maps, All_System, etc.)
    for group_dir in *; do
        if [ -d "$group_dir" ]; then
            # Determine target subdirectory name in /opt/ut2004
            target_name=""
            
            # Helper logic to strip "All_" prefix or map specific names
            # Many folders are named like "All_Maps", "All_System"
            if [[ "$group_dir" == All_* ]]; then
                target_name="${group_dir#All_}"
            fi

            # Specific Overrides/Mappings
            case "$group_dir" in
                "All_UT2004.EXE") target_name="System" ;;
                *"_Sounds_Speech_System_Help")
                    # Extract language prefix
                    lang="${group_dir%%_*}"
                    if [ "$lang" == "English" ]; then
                        target_name="."
                    else
                        # For other languages, we need to handle subdirectories specially
                        # We can't just set target_name, we need a custom handling block
                        msg2 "Processing $lang assets..."
                        for sub in "$group_dir"/*; do
                            if [ -d "$sub" ]; then
                                subname=$(basename "$sub")
                                # Map subfolder to subfolder_Lang
                                dest="$pkgdir/opt/ut2004/${subname}_${lang}"
                                install -d "$dest"
                                cp -r "$sub"/* "$dest/"
                            fi
                        done
                        continue # Skip standard copy logic
                    fi
                    ;;
                *"_Manual")
                     # Extract language prefix
                    lang="${group_dir%%_*}"
                    if [ "$lang" == "English" ]; then
                         target_name="Manual"
                    else
                         target_name="Manual_$lang"
                    fi
                    ;;
                "US_License.int") target_name="System" ;;
            esac
            
            # If we have a valid target name (standard copy logic)
            if [ -n "$target_name" ]; then
                # Handle "." mapping (copy contents to root)
                if [ "$target_name" == "." ]; then
                    dest="$pkgdir/opt/ut2004"
                    install -d "$dest"
                    msg2 "Moving contents of $group_dir to $dest..."
                    # Use cp -rT or simply cp -r * to merge
                    cp -r "$group_dir"/* "$dest/"
                else
                    dest="$pkgdir/opt/ut2004/$target_name"
                    install -d "$dest"
                    msg2 "Moving contents of $group_dir to $dest..."
                    cp -r "$group_dir"/* "$dest/"
                fi
            else
                msg2 "Skipping unknown group directory: $group_dir"
            fi
        fi
    done
    
    # Move default config files to a User folder for use during first-run.
    # These typically reside in System/ after extraction
    msg2 "Creating User folder from System defaults..."
    install -d "$pkgdir/opt/ut2004/User"
    for f in CacheRecords.ucl DefUnrealEd.ini DefUser.ini Default.ini User.ini; do
        if [ -f "$pkgdir/opt/ut2004/System/$f" ]; then
            mv "$pkgdir/opt/ut2004/System/$f" "$pkgdir/opt/ut2004/User/"
        fi
    done
    
    # Remove conflicting binaries/libraries and code from System folder
    msg2 "Removing conflicting binaries and code from System folder..."
    find "$pkgdir/opt/ut2004/System" -type f \( -name "*.bin" -o -name "*.so" -o -name "*.exe" -o -name "*.dll" -o -name "*.u" -o -name "*.upl" -o -name "*.md5" -o -executable \) -delete
    rm -f "$pkgdir/opt/ut2004/System/Build.ini"
    
    # Also remove the default run scripts and similar if they exist, to be safe
    rm -f "$pkgdir/opt/ut2004/System/ut2004.bin"
    rm -f "$pkgdir/opt/ut2004/System/ut2004-bin"

    # Remove conflicting Web directory
    msg2 "Removing conflicting Web directory..."
    rm -rf "$pkgdir/opt/ut2004/Web"
    
    # Remove conflicting Help files
    msg2 "Removing conflicting Help files..."
    rm -f "$pkgdir/opt/ut2004/Help/DebuggerLogo.bmp"
    rm -f "$pkgdir/opt/ut2004/Help/InstallerLogo.bmp"
}
