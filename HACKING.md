### Editing the theme

#### Editing the CSS based themes in the `common` directory (cinnamon, gnome-shell, gtk-3.0)

This theme uses libsass to process the various .scss files. Never edit any of the .css files manually.

* Edit the `common/*/sass/*.scss` files.

* Run `make` to generate all css files using `sassc`.

#### Editing the GTK 2 themes

* Go to `common/gtk-2.0`

* The colors and includes are defined in `light/gtkrc`, `dark/gtkrc` and `darker/gtkrc` for each theme variant

* `main.rc` contains the major part of the theme

* `panel.rc` contains the panel styling for Xfce and MATE

* `apps.rc` contains some application specific rules

Because this theme is heavily based on the pixmap engine, a lot of the styling comes from the images in the `light/assets` and `dark/assets` folders. Don't edit these images directly. See the next section.

#### Editing the images for the GTK 2, GTK 3 and XFWM4 themes

* Go to the `common/gtk-2.0/{light,dark}`, `common/gtk-3.0/$gtk-version` or `common/xfwm4/{light,dark}` directory.

* Open the `assets.svg` file in inkscape. Each object in the .svg file corresponds to an image in the `assets` folder.

* Find the object you want to edit and make your changes. **Important:** Don't change the object *id*!

* Save `assets.svg` and run `make` (or `make -j$(nproc)` if you're in a hurry) from a terminal in the parent directory.

---

### Contributing to the project

The main purpose of this fork is to *maintain* the theme. This means that all major changes to the visual style should be avoided, unless there are very good reason for them.

All contributions to the theme are appreciated, as long as they are useful and well implemented, and don't increase the maintenance load, or unnecessarily alter the visual style. If you're unsure about anything, or would like to work on some larger project, it's not a bad idea to open an issue for discussion before submitting a pull request.

#### Sending pull requests

Nicely split single-purpose commits, and clean and descriptive commit messages are greatly appreciated. Please abide by the following commit message guidelines if possible:

* Prepend the first line of the message with a tag describing what part of the theme is affected, e.g. `gtk3:`, `cinnamon:`, `build:` etc. This makes the commit logs much cleaner.

* Add a *full link* to the pull request you opened, or a related github issue at the end of the commit message for future reference.


