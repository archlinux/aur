## Installing Arc from the source

#### Getting the source

To get the source, either clone the git repository with:

    git clone https://github.com/jnsh/arc-theme --depth 1
    cd arc-theme/

Or download and extract a [snapshot](https://github.com/jnsh/arc-theme/archive/master.zip) of the master branch:

    wget https://github.com/jnsh/arc-theme/archive/master.zip
    unzip master.zip
    cd arc-theme-master/

#### Build and install

##### Installing system wide for all users

Install to `/usr/share/themes` for all users by running the following with root permissions:

    ./autogen.sh --prefix=/usr
    make install

##### Installing for single user

Use the following commands to install the theme to `~/.local/share/themes/` for your user only:

    ./autogen.sh --prefix=$HOME/.local
    make install

**Note:** Some themes (at least GTK 2) aren't loaded from `~/.local/share/themes/`. You can work around this e.g. by symlinking the Arc theme directories in `~/.local/share/themes/` to `~/.themes/` with following commands:

    mkdir -p ~/.themes/
    for d in Arc{,-Dark,-Darker,-Lighter}{,-solid}; do
      [ -d ~/.local/share/themes/$d ] && ln -s ~/.local/share/themes/$d ~/.themes/;
    done

## Dependencies

#### Build dependencies

To build the theme the following packages are required:
* `autoconf`
* `automake`
* `pkgconf`

The following packages are only required for building certain themes:
* `sassc` for GTK 3, Cinnamon, and GNOME Shell
* `inkscape` for GTK 2, GTK 3, and XFWM

You can avoid these dependencies by disabling support for the specific themes with build options detailed below.

##### Optional build dependencies

The following packages are optional, but used to optimize the built theme if available:
* `optipng` for optimizing PNG assets for GTK 2, GTK 3, and XFWM

#### Runtime dependencies

For the GTK 2 theme to function properly, install the following:
* `gnome-themes-extra`, or `gnome-themes-standard` before GNOME version 3.28
* The murrine GTK 2 engine. This has different names depending on the distribution:
  * `gtk-engine-murrine` (Arch Linux)
  * `gtk2-engines-murrine` (Debian, Ubuntu, elementary OS)
  * `gtk-murrine-engine` (Fedora)
  * `gtk2-engine-murrine` (openSUSE)
  * `gtk-engines-murrine` (Gentoo)

## Versioned themes

The source code comes branched for different versions of GTK 3, GNOME Shell, and Cinnamon. Only one version of those themes will be installed, and using the wrong versions will result in issues of varying severity.

The theme versions that will be built can be set manually with build options. Otherwise the build system tries to determine correct versions using the following packages on the build environment:
* `gnome-shell` for detecting GNOME Shell version
* `cinnamon` for detecting Cinnamon version
* the GTK 3 package, or its development files for distributions that ship those separately (e.g. `libgtk-3-dev` for Debian based distros or `gtk3-devel` for RPM based distros), for detecting GTK 3 version

The above packages are not required if the theme versions are defined manually (see build options below).

**Note:** The build will fail, if GTK 3, Cinnamon, or GNOME Shell versions can't be determined. You can work around this by either disabling the build of a specific theme, or by specifying the versions manually with build options detailed below.

## Build options

Options to pass to `autogen.sh`:

    --disable-transparency        disable transparency in the theme
    --disable-light               disable Arc Light support
    --disable-darker              disable Arc Darker support
    --disable-dark                disable Arc Dark support
    --disable-lighter             disable Arc Lighter support

    --disable-cinnamon            disable Cinnamon support
    --disable-gnome-shell         disable GNOME Shell support
    --disable-gtk2                disable GTK 2 support
    --disable-gtk3                disable GTK 3 support
    --disable-metacity            disable Metacity support
    --disable-plank               disable Plank support
    --disable-unity               disable Unity support
    --disable-xfwm                disable XFWM support

    --with-cinnamon=<version>     build the Cinnamon theme for a specific version
    --with-gnome-shell=<version>  build the GNOME Shell theme for a specific version
    --with-gtk3=<version>         build the GTK 3 theme for a specific version

If the `--disable-transparency` option was used, the theme will be installed with `-solid` suffix.

## Uninstallation

Run the following from the source code directory:

    make uninstall

Or simply remove the theme directories from your install location, e.g.

    rm -rf ~/.local/share/themes/Arc{,-Dark,-Darker,-Lighter}{,-solid}
