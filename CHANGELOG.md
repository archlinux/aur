# Minimal Elite Dangerous Launcher
Cross-platform launcher for the game Elite Dangerous. Created mainly to avoid the long startup
time of the default launcher when running on Linux. Can be used with Steam, Epic and Frontier
accounts on both Windows and Linux.

![preview-gif]

## Table of Contents
* [Features]
* [Usage]
    * [Setup]
        * [Steam]
        * [Epic]
        * [Frontier]
    * [Arguments]
        * [Shared]
        * [Min-Launcher-Specific]
    * [Settings]
    * [Multi-Account]
        * [Frontier account via Steam or Epic]
        * [Epic account via Steam]
    * [Troubleshooting]
    * [Cache]
* [Build]
    * [Release Artifacts]

## Features
* **Minimal Interface**

  No waiting for a GUI to load. No waiting for the embedded web browser to load. No waiting
  for remote logs to be sent to FDev. For those that play on Linux, no waiting for the Wine
  environment.

* **Auto-run**

  Automatically starts the game instead of you having to click the _Play_ button. The default
  launcher also supports this by using the `/autorun` [flag].

* **Auto-launch Processes**

  Via the [Settings] file, you can specify additional programs to launch automatically. This
  includes things like [Elite Log Agent] and [VoiceAttack]. Processes are automatically closed
  when the game closes. This means you don't have to run the programs on computer startup or
  have to remember to start them before you launch the game.

* **Auto-quit**

  Automatically close the launcher when you close your game. The default launcher also supports
  this by using the `/autoquit` [flag].

* **Auto-restart**

  Automatically restart your game. This can be useful if you're [grinding] for manufactured
  engineering materials. Off by default. This feature isn't supported on the Epic platform.
  See the [Min-Launcher-Specific] section for more details.

* **Multi-Account**

  Supports running your Steam, Epic and Frontier Store accounts with one game installation.
  See [details] for how this works.

## Usage

This launcher doesn't setup/link new accounts. You'll need to either launch Elite Dangerous at least once with
the default launcher or manually create and link your account(s).

### Setup
#### Steam
1. Download the [latest release] for your operating system
2. Extract executable from the zip/tar archive
3. Place `MinEdLauncher` in your Elite Dangerous install location so that it's in the same folder
   as `EDLaunch.exe`. `MinEdLauncher.Bootstrap` is for Epic only and may be ignored. To find your install
   directory:
    1. Right click _Elite Dangerous_ in your Steam library
    2. Select _properties_
    3. In the _Local Files_ tab, click _Browse Local Files..._
4. Update your launch options to point to `MinEdLauncher`.
    1. Right click _Elite Dangerous_ in your Steam library
    2. Select _properties_
    3. In the _general_ tab, click _Set Launch Options_
    4. Windows users - Set the value to `cmd /c "MinEdLauncher.exe %command% /autorun /autoquit /edh4"`

       Linux users - The command will depend on which terminal emulator you use. Examples for
       [alacritty], [gnome-terminal] and [konsole] are below.

       `alacritty -e ./MinEdLauncher %command% /autorun /autoquit /edh4`

       `gnome-terminal -- ./MinEdLauncher %command% /autorun /autoquit /edh4`

       `konsole -e ./MinEdLauncher %command% /autorun /autoquit /edh4`
5. Launch your game as you normally would in Steam
#### Epic
1. Download the [latest release] for your operating system
2. Extract executable from the zip/tar archive
3. Place `MinEdLauncher` in your Elite Dangerous install location so that it's in the same folder
   as `EDLaunch.exe`.

##### Windows
Either configure the Epic client and use the provided Bootstrap exe or use [legendary] to launch the game

* Epic Client
  1. Delete or rename `EDLaunch.exe` (e.g. `EDLaunch.exe.bak`)
  2. Copy and rename `MinEdLauncher.Bootstrap.exe` to `EDLaunch.exe`. This step is required because
     Epic doesn't allow changing the game's startup application. If someone knows how to modify the
     game's manifest file (`EliteDangerous/.egstore/*.manifest`), this could be avoided. Please open
     a [new issue] if you can help with this. This also means any time the game updates or you verify
     your game files, you'll have to replace `EDLaunch.exe` with `MinEdLauncher.Bootstrap.exe`.
  3. Update your launch options to auto start your preferred product
      1. Click _Settings_ in the Epic Games Launcher
      2. Scroll down to the _Manage Games_ section and click _Elite Dangerous_
      3. Check _Additional Command Line Arguments_
      4. Set the value to `/autorun /autoquit /edh4`
  4. Launch your game as you normally would in Epic
* Legendary

    Use legendary's `override-exe` argument via windows terminal

    `legendary.exe launch 9c203b6ed35846e8a4a9ff1e314f6593 --override-exe MinEdLauncher.exe /autorun /edh4 /autoquit`

##### Linux
This method utilizes [legendary].

1. Ensure you've authenticated, installed Elite Dangerous via [legendary] and setup your wine prefix
2. Use the `--dry-run` flag and pass the arguments to `MinEdLauncher` via command substitution
    ```sh
    WINEPREFIX=/your/wine/prefix /path/to/MinEdLauncher $(legendary launch --dry-run 9c203b6ed35846e8a4a9ff1e314f6593 2>&1 | grep "Launch parameters" | cut -d':' -f 3-) /autorun /edh4 /autoquit
    ```

#### Frontier
1. Download the [latest release] for Windows
2. Extract executables from the zip archive
3. Place `MinEdLauncher.exe` in your Elite Dangerous install location so that it's in the same folder as `EDLaunch.exe`.
   `MinEdLauncher.Bootstrap` is for Epic only and may be ignored.
4. Create a shortcut to `MinEdLauncher.exe` by right-clicking it and selecting _create shortcut_
5. Right-click the newly made shortcut and select _properties_
6. Add the `/frontier profile-name` argument + your other desired arguments to the end of the _Target_ textbox (e.g. `C:\path\to\MinEdLauncher.exe /frontier profile-name /autorun /autoquit /edh4`)
7. Click _Ok_

You can place this shortcut anywhere. It doesn't have to live in the Elite Dangerous install folder.

### Arguments
#### Shared
The following arguments are understood by both the vanilla launcher and the minimal launcher.
Note that specifying a product flag will override whatever option you select when Steam prompts
you to select a version of the game.

| Argument       | Effect                                                    |
|----------------|-----------------------------------------------------------|
| /autoquit      | Automatically close the launcher when the game closes     |
| /autorun       | Automatically start selected product when launcher starts |
| /ed            | Select Legacy Elite Dangerous as the startup product      |
| /edh           | Select Legacy Horizons as the startup product             |
| /eda           | Select Elite Dangerous Arena as the startup product       |
| /vr            | Tell the game that you want to play in VR mode            |
| -auth_password | Epic exchange code. Used for authenticating with Epic     |

#### Min Launcher Specific
The following arguments are in addition to the above:

| Argument               | Effect                                                                                                                                                                                                  |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| /edo                   | Select Elite Dangerous Odyssey as the startup product                                                                                                                                                   |
| /edh4                  | Select Elite Dangerous Horizons as the startup product                                                                                                                                                  |
| /frontier profile-name | Use this argument to login with a Frontier Store account. `profile-name` can be any name you want. Keep it to letters, numbers, dashes and underscores. See more details in the [multi-account] section |
| /restart delay         | Restart the game after it has closed with _delay_ being the number of seconds given to cancel the restart (i.e `/restart 3`)                                                                            |
| /dryrun                | Prints output without launching any processes                                                                                                                                                           |

Note that the restart feature doesn't work with Epic accounts. After Elite launches, it invalidates
the launcher's auth token and doesn't communicate the new token which then prevents the ability to
login with FDev servers a second time.

### Settings
The settings file controls additional settings for the launcher that go beyond what the default
launcher supports. The location of this file is in the standard config location for your
operating system. If this file doesn't exist, it will be created on launcher startup.

Windows: `%LOCALAPPDATA%\min-ed-launcher\settings.json`

Linux: `$XDG_CONFIG_HOME/min-ed-launcher/settings.json` (`~/.config` if `$XDG_CONFIG_HOME` isn't set)

| Settings                | Effect                                                                                                                                                                                                                                                                              |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| apiUri                  | FDev API base URI. Should only be changed if you are doing local development                                                                                                                                                                                                        |
| watchForCrashes         | Determines if the game should be launched by `WatchDog64.exe` or not                                                                                                                                                                                                                |
| gameLocation            | Path to game's install folder. Specify this if the launcher can't figure it out by itself                                                                                                                                                                                           |
| language                | Sets the game's language. Supported values are _en_ and the names of the language folders in Elite's install directory                                                                                                                                                              |
| autoUpdate              | Automatically update games that are out of date                                                                                                                                                                                                                                     |
| checkForLauncherUpdates | Check if there is a newer version of min-ed-launcher                                                                                                                                                                                                                                |
| maxConcurrentDownloads  | Maximum number of simultaneous downloads when downloading updates                                                                                                                                                                                                                   |
| forceUpdate             | By default, Steam and Epic updates are handled by their respective platform. In cases like the Odyssey alpha, FDev doesn't provide updates through Steam or Epic. This allows the launcher to force updates to be done via FDev servers by providing a comma delimited list of SKUs |
| processes               | Additional applications to launch before launching the game                                                                                                                                                                                                                         |
| shutdownProcesses       | Additional applications to launch after game has shutdown                                                                                                                                                                                                                           |
| shutdownTimeout         | Time, in seconds, to wait for additional applications to shutdown before forcefully terminating them                                                                                                                                                                                |
| filterOverrides         | Manually override a product's filter for use with launch options filter flag (e.g. /edo, /edh, etc...)                                                                                                                                                                              |
| additionalProducts      | Provide extra products to the authorized product list. Useful for launching Horizons 4.0 when you own the Odyssey DLC                                                                                                                                                               |
| cacheDir                | Path to directory used for downloading game updates. See [cache] section for default location                                                                                                                                                                                       |
| gameStartDelay          | Time to delay after starting processes but before starting ED. Defaults to zero                                                                                                                                                                                                     |
| shutdownDelay           | Time to delay before closing processes. Defaults to zero                                                                                                                                                                                                                            |

When specifying a path for `gameLocation`, `cacheDir` or `processes.fileName` on Windows, it's required to escape backslashes. Make sure to use a
double backslash (`\\`) instead of a single backslash (`\`).

```json
{
  "apiUri": "https://api.zaonce.net",
  "watchForCrashes": false,
  "gameLocation": null,
  "language": "en",
  "autoUpdate": true,
  "checkForLauncherUpdates": true,
  "maxConcurrentDownloads": 4,
  "forceUpdate": "PUBLIC_TEST_SERVER_OD",
  "cacheDir": "C:\\path\\to\\dir",
  "gameStartDelay": 0,
  "shutdownDelay": 0,
  "processes": [
    {
      "fileName": "C:\\path\\to\\app.exe",
      "arguments": "--arg1 --arg2"
    },
    {
      "fileName": "C:\\path\\to\\app2.exe",
      "arguments": "--arg1 --arg2"
    }
  ],
  "shutdownProcesses": [
    {
      "fileName": "C:\\path\\to\\app.exe",
      "arguments": "--arg1 --arg2"
    }
  ],
  "shutdownTimeout": 10,
  "filterOverrides": [
    { "sku": "FORC-FDEV-DO-1000", "filter": "edo" },
    { "sku": "FORC-FDEV-DO-38-IN-40", "filter": "edh4" }
  ],
  "additionalProducts": [{
    "filter": "edh4",
    "directory": "elite-dangerous-odyssey-64",
    "serverargs": "",
    "gameargs": "SeasonTwo",
    "sortkey": "04",
    "product_name": "Elite Dangerous: Horizons (4.0)",
    "product_sku": "FORC-FDEV-DO-38-IN-40"
  }]
}
```

### Multi-Account
#### Frontier account via Steam or Epic
By using the `/frontier profile-name` argument, you can login with any number of Frontier accounts with a
single game installation. Your launch command might look like the following

Windows: `cmd /c "MinEdLauncher.exe %command% /frontier profile-name /autorun /autoquit /edh4"`

Linux: `alacritty -e ./MinEdLauncher %command% /frontier profile-name /autorun /autoquit /edh4`

See the [setup] section above for how you might run this on your platform.

If you have multiple frontier accounts, use a different profile name for each of them. After successfully
logging in, there will be a `.cred` file created in either `%LOCALAPPDATA%\min-ed-launcher\` or
`$XDG_CONFIG_DIR/min-ed-launcher/` (depending on OS). This file stores your username, password and machine
token. On Windows, the password and machine token are encrypted via DPAPI (same as the vanilla launcher).
On Linux, no encryption happens but the file permissions are set to 600. If you login once and then decide
you want to login again (refresh machine token), you can delete the appropriate `.cred` file.

#### Epic account via Steam
There is rudimentary support for running your Epic account via Steam. Running a Steam account without Steam installed and running is not supported.

In order to authenticate with an Epic account:
1. Get an Epic exchange code. This part is really clunky and will need to be done for every launch as the exchange code expires after one use.

    * **Legendary** - Extract the code via [legendary]'s `--dry-run` option.
        ```sh
        legendary launch --dry-run 9c203b6ed35846e8a4a9ff1e314f6593 2> >(grep AUTH_PASSWORD) | sed -ne 's/^.*-AUTH_PASSWORD=\([a-z0-9]*\).*$/\1/p'
        ```
    * **Manually** - Within the Epic launcher, click your username and select manage account. This will open a browser. The URL will contain an `exchangeCode=code`
    parameter. Copy the code before the page is redirected (can just hit the stop button in your browser).
2. Add the `-auth_password=code` argument to your launch options. `cmd /c "MinEdLauncher.exe %command% /autoquit /edh4 -auth_password=code"`

   You can also create a separate shortcut. Right click game in your Steam library and create desktop shortcut. Edit the properties of the shortcut
   to include the `-auth_password=code` argument. `"C:\Program Files (x86)\Steam\Steam.exe" -gameidlaunch 359320 -auth_password=code`. Then just
   edit this shortcut with the new exchange code each time instead of changing your Steam launch options.

### Steam Shortcuts
You can create multiple shortcuts with different launch parameters. Prefer avoiding the steam protocol handler
as it has some [quirks] that make it more of a pain to use.

Example _Target_ field for a shortcut that launches Odyssey:

`"C:\Program Files (x86)\Steam\Steam.exe" -gameidlaunch 359320 /edo`


### Troubleshooting
Debug logging is placed in the standard log location for your operating system:
* Windows - `%LOCALAPPDATA%\min-ed-launcher\min-ed-launcher.log`
* Linux - `$XDG_STATE_HOME/min-ed-launcher/min-ed-launcher.log` (`~/.local/state` if `$XDG_STATE_HOME` isn't set)

### Cache
When updating your game files, the launcher downloads updates into a temporary directory. You may delete these files at any time.
The location of these files are in the standard cache location for your operating system.

Windows: `%LOCALAPPDATA%\min-ed-launcher\cache`

Linux: `$XDG_CACHE_HOME/min-ed-launcher` (`~/.cache` if `$XDG_CACHE_HOME` isn't set)

You can override the default location by specifying the `cacheDir` property in your [settings].

## Build
Two different toolchains are needed to build the entire project. .NET is used for the launcher itself and Rust is used
for the bootstrapper. Since the bootstrapper is only used for users playing via Epic, you may not need to setup both.

### Launcher
1. Install the [.Net SDK]

    At least version 7. In general, min-ed-launcher follows the latest version of the SDK.
2. Clone repository and build
    ```
    $ git clone https://github.com/rfvgyhn/min-ed-launcher
    $ cd min-ed-launcher
    $ dotnet build -c Release
    $ dotnet run -c Release --project src/MinEdLauncher/MinEdLauncher.fsproj
   ```
   If you'd prefer a single, self-contained binary, use `publish` instead of `build`. See [publish.sh] or [publish.ps1] for more details.

### Bootstrapper
This project is Windows specific and won't compile on other operating systems.

1. [Install Rust]

   In general, min-ed-launcher follows the latest _stable_ version of the compiler.
2. After cloning the repo (mentioned above), compile via cargo:
    ```
    $ cargo build --release
    $ .\target\release\bootstrap.exe
    ```
### Release Artifacts
Run either `publish.sh` or `publish.ps1` depending on your OS. These scripts make use of `dotnet publish`. Artifacts will end up in the `artifacts`folder.

Note that the bootstrap project specifically targets Windows and won't publish on a non-Windows machine.

[preview-gif]: https://rfvgyhn.blob.core.windows.net/elite-dangerous/min-ed-launcher-demo.gif
[Settings]: #settings
[flag]: #arguments
[setup]: #setup
[Elite Log Agent]: https://github.com/DarkWanderer/Elite-Log-Agent
[VoiceAttack]: https://voiceattack.com/
[details]: #multi-account
[grinding]: https://www.reddit.com/r/EliteDangerous/comments/ggffqq/psa_2020_farming_engineering_materials_a_compiled/
[latest release]: https://github.com/Rfvgyhn/min-ed-launcher/releases
[new issue]: https://github.com/Rfvgyhn/min-ed-launcher/issues
[alacritty]: https://github.com/alacritty/alacritty
[gnome-terminal]: https://wiki.gnome.org/Apps/Terminal
[konsole]: https://konsole.kde.org/
[.Net SDK]: https://dotnet.microsoft.com/download/dotnet
[install rust]: https://www.rust-lang.org/tools/install
[Features]: #features
[Usage]: #usage
[Steam]: #steam
[Epic]: #epic
[Frontier]: #frontier
[Arguments]: #arguments
[Shared]: #shared
[Min-Launcher-Specific]: #min-launcher-specific
[Multi-Account]: #multi-account
[Frontier account via Steam or Epic]: #frontier-account-via-steam-or-epic
[Epic account via Steam]: #epic-account-via-steam
[Troubleshooting]: #troubleshooting
[Cache]: #cache
[Build]: #build
[Release Artifacts]: #release-artifacts
[legendary]: https://github.com/derrod/legendary
[quirks]: https://github.com/rfvgyhn/min-ed-launcher/issues/45#issuecomment-1030312606
[publish.sh]: publish.sh
[publish.ps1]: publish.ps1
[multi-account]: #frontier-account-via-steam-or-epic
