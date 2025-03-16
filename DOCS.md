# 🍫 Chocolate Project Manager Documentation

Chocolate is a lightweight project manager designed for managing virtual environments, handling dependencies, and automating project tasks.



## 🎯 **Usage**

```bash
chocolate <action> [options] [arguments]
```



## 📂 **Creating a New Project**

```bash
chocolate new
```



## 🚀 **Running the Project**

```bash
chocolate run
```

- Runs the project's main file inside the virtual environment.
- Automatically loads environment variables and flags.

### ✅ Example:

```bash
chocolate run
```

### With `--reinstall` flag (force reinstall dependencies):

```bash
chocolate run --reinstall
```



## 📦 **Managing Packages**

### Install Packages:

```bash
chocolate add <package_name> ...
```

- Installs and adds packages to the `.chocolate` configuration.

### ✅ Example:

```bash
chocolate add rich requests flask
```

### Reinstall All Packages:

```bash
chocolate reinstall
```



## 🌐 **Managing Environment Variables**

### List All Variables:

```bash
chocolate env list
```

### Add Environment Variables:

```bash
chocolate env VAR1=value VAR2=value
```

### Remove Variables:

```bash
chocolate env remove VAR1 VAR2
```

### Make Variable Private/Public:

```bash
chocolate env private VAR1 VAR2
```



## 🏁 **Managing Flags**

```bash
chocolate flags <flags>
```

### ✅ Example:

```bash
chocolate flags --debug --fast
```



## 🛠️ **Custom Actions**

### Add a New Action:

```bash
chocolate action add <action_name> <command>
```

- Use -i <file name> to add multiple line actions.

### Remove an Action:

```bash
chocolate action remove <action_name>
```

### Run an Action:

```bash
chocolate action <action_name>
```



## 🛤️ **Handling Paths**

### Exclude Paths:

```bash
chocolate path exclude <path1> <path2>
```

### Include Paths Back:

```bash
chocolate path include <path1> <path2>
```

### List Excluded Paths:

```bash
chocolate path list
```



## 📤 **Export the Project**

```bash
chocolate export -o <output.zip>
```



## 📝 **Help**

```bash
chocolate help
```



## 🔥 **Examples**

```bash
# Create a project
chocolate new -n my_project -m main.py

# Install packages
chocolate add requests rich flask

# Run the project
chocolate run

# Add environment variable
chocolate env API_KEY=123456789

# Reinstall all packages
chocolate reinstall

# Export the project as a zip
chocolate export -o my_project.zip
```



## ✅ **Conclusion**

Chocolate Project Manager is designed to handle everything from project initialization to dependency management and custom automation.
